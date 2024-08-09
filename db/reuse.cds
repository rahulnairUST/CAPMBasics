namespace ust.reuse;

//reusable type for single field
type Guid: String(32);

//We want group of fields in our requirement to be reusable. So we use aspect
aspect address {
    houseNo: Integer;
    street: String(32);
    sector: String(44);
    landmark: String(80);
    city: String(55);
    country: String(4);
}