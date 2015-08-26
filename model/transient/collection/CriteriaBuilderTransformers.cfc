/** wraps the transformers hibernate class with helper methods to make it easier to deal will collections*/
component  output="true" accessors="true" displayname="CriteriaBuilderTransformers" hint="This is a wrapper for the hibernate criteria builder" persistent="false"  
{
	property name="errors" type="array";
	property name="transformers" type="any";
	
	public CriteriaBuilderTransformers function init(){
		//Gets a list of all restrictions methods from hibernate
		setTransformers(createObject("java", "org.hibernate.transform.Transformers"));
		return this;
	}
	public any function aliasToBean(any class){
		return getTransformers().aliasToBean(arguments.class);
	}
    
}

