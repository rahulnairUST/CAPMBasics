module.exports = cds.service.impl( async function(){

    //Step 1: get the object of our odata entities
    const { EmployeeSet, POs } = this.entities;

    this.before('UPDATE', EmployeeSet, (req)=>{
        let oSalaryAmnt = req.data.salaryAmount;
        if(oSalaryAmnt >= 1000000) {
            req.error(400, 'Salary out of range');
        }
    })

    this.on('boost', async (req,res) => {
        try{
            const id = req.params[0];
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT: { '+=' : 20000 },
                NOTE: 'Boosted!!'
            }).where(id);
        }
        catch (error) {
            return "Error " + error.toString();
        }
    });

});