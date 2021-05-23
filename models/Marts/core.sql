-- SELECT PARSE_DATE('%d-%b-%y', InvoiceDate) as the_day from `ecommerce-data-analysis-314301.ecommerce.sales_ecommerce_data`

-- Description extractions of words
-- Date readable formate 

-- with dateTrans as
-- (
--     SELECT PARSE_DATE('%d-%b-%y', InvoiceDate) as InvoiceDate from `ecommerce-data-analysis-314301.ecommerce.sales_ecommerce_data`
-- )
with children_prod as (
   SELECT
    count(DISTINCT Description) as child_products
from `ecommerce-data-analysis-314301.ecommerce.sales_ecommerce_data`
where
    REGEXP_CONTAINS(Description,'(CHILD|GIRL|BOY|TEDDY BEAR|DOLLY|CIRCUS)') 
)
,
with kitchen_prod as (
SELECT
    count(DISTINCT Description) as kitchen
from `ecommerce-data-analysis-314301.ecommerce.sales_ecommerce_data`
where
    REGEXP_CONTAINS(Description,'(BAKING|CAKE|COOK|JAM)')
)
select * from children_prod