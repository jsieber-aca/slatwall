/** wraps the restrictions hibernate class with helper methods to make it easier to deal will collections */
component  output="true" accessors="true" displayname="CriteriaBuilderRestrictions" hint="This is a wrapper for the hibernate criteria builder" persistent="false"  
{
	property name="errors" type="array";
	property name="restrictions" type="any";
	
	public CriteriaBuilderRestrictions function init(){
		//Gets a list of all restrictions methods from hibernate
		setRestrictions(createObject("java", "org.hibernate.criterion.Restrictions"));
		return this;
	}
    public any function _allEq(required any propertyNameStruct){
    	return restrictions.allEq(propertyNameStruct);
    }
    public any function _and(required any restrictionArray){
        return this._conjunction(arguments.restrictionArray);
    }
    public any function _between(required any str, required any min, required any max) {
    	return restrictions.between(str, min, max);
    }
    public any function _eq(required any str, required any obj) {
        return restrictions.eq(str, obj);
    }
    public any function _eqProperty(required any str, required any str2) {
        return restrictions.eqProperty(str, str2);
    }
    public any function _ge(required any str, required any obj) {
        return restrictions.ge(str, obj);
    }
    public any function _geProperty(required any str, required any str2) {
        return restrictions.geProperty(str, str2);
    }
    public any function _gt(required any str, required any obj) {
        return restrictions.gt(str, obj);
    }
    public any function _gtProperty(required any str, required any str2) {
        return restrictions.gtProperty(str, str2);
    }
    public any function _idEq(required any obj) {
        return restrictions.idEq(obj);
    }
    public any function _iLike(required any str, required any obj) {
        return restrictions.iLike(str, obj);
    }
    public any function _in(required any str, array objArray) {
        return restrictions.in(str, objArray);
    }
    public any function _isEmpty(required any str) {
        return restrictions.isEmpty(str);
    }
    public any function _isNotEmpty(required any str) {
        return restrictions.isNotEmpty(str);
    }
    public any function _isNotNull(required any str) {
        return restrictions.isNotNull(str);
    }
    public any function _isNot(required any str) {
        return restrictions.isNull(str);
    }
    public any function _le(required any str, required any obj) {
        return restrictions.isNull(str);
    }
    public any function _leProperty(required any str, required any str1) {
        return restrictions.leProperty(str, str1);
    }
    public any function _like(required any str, required any obj) {
        return restrictions.like(str, obj);
    }
    public any function _lt(required any str, required any obj) {
        return restrictions.lt(str, obj);
    }
    public any function _ltProperty(required any str, required any str1) {
        return restrictions.ltProperty(str, str1);
    }
    public any function _ne(required any str, required any obj) {
        return restrictions.ne(str, obj);
    }
    public any function _neProperty(required any str, required any str2) {
        return restrictions.neProperty(str, str2);
    }
    public any function _not(required any criterion) {
        return restrictions.not(criterion);
    }
    public any function _or(required any restrictionArray) {
       return this._disjunction(restrictionArray);
    }
    public any function _sizeEq(required any str, required any int) {
        return restrictions.sizeEq(str, int);
    }
    public any function _sizeGe(required any str, required any int) {
        return restrictions.sizeGe(str, int);
    }
    public any function _sizeGt(required any str, required any int) {
        return restrictions.sizeGt(str, int);
    }
    public any function _sizeLe(required any str, required any int) {
        return restrictions.sizeLe(str, int);
    }
    public any function _sizeLt(required any str, required any int) {
        return restrictions.sizeLt(str, int);
    }
    public any function _sizeNe(required any str, required any int) {
        return restrictions.sizeNe(str, int);
    }
    public any function _sqlRestriction(required any str) {
        return restrictions.sqlRestriction(str);
    }
    public any function _conjunction(required any restrictionArray) {
    	var newConjunction = restrictions.conjunction();
    	for (restriction in restrictionArray){
    		newConjunction.add(restriction);
    	}
        return newConjunction;
    }
    public any function _disjunction(required any restrictionArray) {
        var newDisjunction = restrictions.disjunction();
        for (restriction in restrictionArray){
            newDisjunction.add(restriction);
        }
        return newDisjunction;
    }
}
