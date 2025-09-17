@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS CASE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_CASE_PWC as select from /dmo/customer
{
   key customer_id as CusatomerID,
    
  
  // CASE SIMPLE
//    case country_code
//        when 'US' then 'United States'
//        when 'DE' then 'Germany'
//        when 'ES' then 'Spain'
//        else 'Another country code'
//        end as case1
//--------------------------------------------------

//CONCATENAR    
 
//    case country_code
//        when 'US' then concat('United States-', concat_with_space(last_name, first_name, 2 ))
//        when 'DE' then concat('Germany-', last_name)
//        when 'ES' then concat('Spain-', last_name)
//        else 'Another country code'
//       end as case1
    
//----------------------------------------------    
    
//       case country_code
//        when 'US' then concat('United States-', concat_with_space(last_name, first_name, 2 ))
//        when 'DE' then concat('Germany-', last_name)
//        when 'ES' then concat('Spain-', last_name)
//        else 'Another country code'
//       end as case1,
//       
//       case when country_code = 'US' or country_code = 'ES' then title
//       when title = 'Mr.' then last_name
//       when cast( '20300101' as abap.dats ) < dats_add_days($session.system_date, -30, 'NULL') then 'Lower Date'
//       else 'No condition applied'
//       end as Case2
       
 //---------------------------------------------   
       
// CASE ANIDADO
       case country_code
        when 'US' then concat('United States-', concat_with_space(last_name, first_name, 2 ))
        when 'DE' then concat('Germany-', last_name)
        when 'ES' then concat('Spain-', last_name)
        else 'Another country code'
       end as case1,
       
       case 
       when country_code = 'US' or country_code = 'ES' then case title
            when 'Mr.' then 'US/ES - Mr.'
            when 'Mrs.' then 'US/ES - Mrs.'
            else 'US/ES- Diferent title'
            end
       when title = 'Mr.' then last_name
       when cast( '20300101' as abap.dats ) < dats_add_days($session.system_date, -30, 'NULL') then 'Lower Date'
       else 'No condition applied'
       end as Case2
    
    
}
