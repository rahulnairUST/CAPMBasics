using CatalogService as service from '../../srv/CatalogService';
annotate service.POs with @(
    UI.SelectionFields: [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMOUNT,
        OVERALL_STATUS
    ],
    UI.HeaderInfo:
        {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Purchase Order',
            TypeNamePlural : 'Purchase Orders',
            Title : {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            Description : {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME,
            },
        },
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'CURRENCY_code',
                Value : CURRENCY_code,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NODE_KEY',
                Value : NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PO_ID',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PARTNER_GUID_NODE_KEY',
                Value : PARTNER_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LIFECYCLE_STATUS',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OVERALL_STATUS',
                Value : OVERALL_STATUS,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Information',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Order Details',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Configuration Details',
                    Target : '@UI.FieldGroup',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'PO Items',
                    Target : 'Items/@UI.LineItem',
                },
            ],
        },
    ],
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : OverallStatus,
        },
    ],
    UI.FieldGroup: {
        Label : 'PO Pricing',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.boost',
            Label : 'Boost',
            Inline: true 
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : OverallStatus,
            Criticality : ColorCode,
        }
    ],
);

annotate service.POs with {
    PARTNER_GUID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'BusinessPartnerSet',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : PARTNER_GUID_NODE_KEY,
                ValueListProperty : 'NODE_KEY',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'BP_ROLE',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'EMAIL_ADDRESS',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'PHONE_NUMBER',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FAX_NUMBER',
            },
        ],
    }
};

annotate service.POItems with @(
    UI.HeaderInfo: {
        TypeName : 'PO Item',
        TypeNamePlural : 'PO Items',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
        }
    },
    UI.Facets: [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'More Info',
            Target : '@UI.Identification',
        },
    ],
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
        },
    ],
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
    ]
);

@cds.odata.ValueList
annotate service.BusinessPartnerSet with @(
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value : COMPANY_NAME,
        },
    ]
);

@cds.odata.ValueList
annotate service.ProductSet with @(
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value : DESCRIPTION,
        },
    ]
);

annotate service.POs with {
    PARTNER_GUID@(
        Common : { 
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: service.BusinessPartnerSet
    )
};

annotate service.POItems with {
    PRODUCT_GUID@(
        Common : { 
            Text : PRODUCT_GUID.DESCRIPTION,
         },
         ValueList.entity: service.ProductSet
    )
};

