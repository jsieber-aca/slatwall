component  displayname="CriteriaBuilderOrder" hint="Allows for orders in the criteria builder query" persistent="false" output="false"  
{
    property name="errors" type="array";
    property name="order" type="any";
    
    public CriteriaBuilderOrder function init(){
        //Gets a list of all orderings methods from hibernate and wraps in cf methods.
        try{
          order = createObject("java", "org.hibernate.criterion.Order");
        }catch(any e){
        	throw(e);
            errors[1] = e;
        }
        return this;
    }
    public any function asc(required any str){
        return order.asc(attributes.str);
    }
    public any function desc(required any str){
        return order.desc(attributes.str);
    }
    public any function ignoreCase(){
        return order.ignoreCase();
    }
    public any function toSqlString(required any criteria, required any criteriaQuery){
        return order.toSqlString(arguments.criteria, arguments.criteriaQuery);
    }
    public any function toString(){
        return order.toString();
    }
    
}