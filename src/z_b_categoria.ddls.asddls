@AbapCatalog.sqlViewName: 'ZV_CATEGORIA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Categorias y descripciones'
define view Z_B_CATEGORIA
  as select from ztb_catego_7202
{
      //ZTB_CATEGO_7202
  key bi_categ,
      descripcion
}
