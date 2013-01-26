/*

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

	Valid Attribute Value Types
	
	product
	orderItem
	account
*/
component displayname="Attribute Value" entityname="SlatwallAttributeValue" table="SlatwallAttributeValue" persistent="true" output="false" accessors="true" extends="BaseEntity" hb_serviceName="attributeService" {
	
	// Persistent Properties
	property name="attributeValueID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="attributeValue" ormtype="string" length="4000";
	property name="attributeValueEncrypted" ormtype="string";
	property name="attributeValueType" ormType="string" formFieldType="select" formatType="custom" notnull="true";
	
	// Related Object Properties (many-to-one)
	property name="attribute" cfc="Attribute" fieldtype="many-to-one" fkcolumn="attributeID" notnull="true";
	property name="account" cfc="Account" fieldtype="many-to-one" fkcolumn="accountID";
	property name="accountPayment" cfc="AccountPayment" fieldtype="many-to-one" fkcolumn="accountPaymentID";
	property name="brand" cfc="Brand" fieldtype="many-to-one" fkcolumn="brandID";
	property name="order" cfc="Order" fieldtype="many-to-one" fkcolumn="orderID";
	property name="orderItem" cfc="OrderItem" fieldtype="many-to-one" fkcolumn="orderItemID";
	property name="orderPayment" cfc="OrderPayment" fieldtype="many-to-one" fkcolumn="orderPaymentID";
	property name="product" cfc="Product" fieldtype="many-to-one" fkcolumn="productID";
	property name="sku" cfc="Sku" fieldtype="many-to-one" fkcolumn="skuID";
	property name="vendor" cfc="Vendor" fieldtype="many-to-one" fkcolumn="vendorID";
	property name="vendorOrder" cfc="VendorOrder" fieldtype="many-to-one" fkcolumn="vendorOrderID";
	
	// Quick Lookup Properties
	property name="attributeID" length="32" insert="false" update="false";
	
	// Remote properties
	property name="remoteID" ormtype="string";
	
	// ============ START: Non-Persistent Property Methods =================
	
	// ============  END:  Non-Persistent Property Methods =================
	
	// ============= START: Bidirectional Helper Methods ===================
	
	// Attribute (many-to-one)
	public void function setAttribute(required any attribute) {
		variables.attribute = arguments.attribute;
		if(isNew() or !arguments.attribute.hasAttributeValue( this )) {
			arrayAppend(arguments.attribute.getAttributeValues(), this);
		}
	}
	public void function removeAttribute(any attribute) {
		if(!structKeyExists(arguments, "attribute")) {
			arguments.attribute = variables.attribute;
		}
		var index = arrayFind(arguments.attribute.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.attribute.getAttributeValues(), index);
		}
		structDelete(variables, "attribute");
	}
	
	// Account (many-to-one)
	public void function setAccount(required any account) {
		variables.account = arguments.account;
		if(isNew() or !arguments.account.hasAttributeValue( this )) {
			arrayAppend(arguments.account.getAttributeValues(), this);
		}
	}
	public void function removeAccount(any account) {
		if(!structKeyExists(arguments, "account")) {
			arguments.account = variables.account;
		}
		var index = arrayFind(arguments.account.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.account.getAttributeValues(), index);
		}
		structDelete(variables, "account");
	}
	
	// Account Payment (many-to-one)
	public void function setAccountPayment(required any accountPayment) {
		variables.accountPayment = arguments.accountPayment;
		if(isNew() or !arguments.accountPayment.hasAttributeValue( this )) {
			arrayAppend(arguments.accountPayment.getAttributeValues(), this);
		}
	}
	public void function removeAccountPayment(any accountPayment) {
		if(!structKeyExists(arguments, "accountPayment")) {
			arguments.accountPayment = variables.accountPayment;
		}
		var index = arrayFind(arguments.accountPayment.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.accountPayment.getAttributeValues(), index);
		}
		structDelete(variables, "accountPayment");
	}
	
	// Brand (many-to-one)
	public void function setBrand(required any brand) {
		variables.brand = arguments.brand;
		if(isNew() or !arguments.brand.hasAttributeValue( this )) {
			arrayAppend(arguments.brand.getAttributeValues(), this);
		}
	}
	public void function removeBrand(any brand) {
		if(!structKeyExists(arguments, "brand")) {
			arguments.brand = variables.brand;
		}
		var index = arrayFind(arguments.brand.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.brand.getAttributeValues(), index);
		}
		structDelete(variables, "brand");
	}
	
	// Order (many-to-one)    
	public void function setOrder(required any order) {    
		variables.order = arguments.order;    
		if(isNew() or !arguments.order.hasAttributeValue( this )) {    
			arrayAppend(arguments.order.getAttributeValues(), this);    
		}    
	}    
	public void function removeOrder(any order) {    
		if(!structKeyExists(arguments, "order")) {    
			arguments.order = variables.order;    
		}    
		var index = arrayFind(arguments.order.getAttributeValues(), this);    
		if(index > 0) {    
			arrayDeleteAt(arguments.order.getAttributeValues(), index);    
		}    
		structDelete(variables, "order");    
	}
	
	// Order Item (many-to-one)
	public void function setOrderItem(required any orderItem) {
		variables.orderItem = arguments.orderItem;
		if(isNew() or !arguments.orderItem.hasAttributeValue( this )) {
			arrayAppend(arguments.orderItem.getAttributeValues(), this);
		}
	}
	public void function removeOrderItem(any orderItem) {
		if(!structKeyExists(arguments, "orderItem")) {
			arguments.orderItem = variables.orderItem;
		}
		var index = arrayFind(arguments.orderItem.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.orderItem.getAttributeValues(), index);
		}
		structDelete(variables, "orderItem");
	}
	
	// Order Payment (many-to-one)
	public void function setOrderPayment(required any orderPayment) {
		variables.orderPayment = arguments.orderPayment;
		if(isNew() or !arguments.orderPayment.hasAttributeValue( this )) {
			arrayAppend(arguments.orderPayment.getAttributeValues(), this);
		}
	}
	public void function removeOrderPayment(any orderPayment) {
		if(!structKeyExists(arguments, "orderPayment")) {
			arguments.orderPayment = variables.orderPayment;
		}
		var index = arrayFind(arguments.orderPayment.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.orderPayment.getAttributeValues(), index);
		}
		structDelete(variables, "orderPayment");
	}
	
	// Product (many-to-one)
	public void function setProduct(required any product) {
		variables.product = arguments.product;
		if(isNew() or !arguments.product.hasAttributeValue( this )) {
			arrayAppend(arguments.product.getAttributeValues(), this);
		}
	}
	public void function removeProduct(any product) {
		if(!structKeyExists(arguments, "product")) {
			arguments.product = variables.product;
		}
		var index = arrayFind(arguments.product.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.product.getAttributeValues(), index);
		}
		structDelete(variables, "product");
	}
	
	// Sku (many-to-one)    
	public void function setSku(required any sku) {    
		variables.sku = arguments.sku;    
		if(isNew() or !arguments.sku.hasAttributeValue( this )) {    
			arrayAppend(arguments.sku.getAttributeValues(), this);    
		}    
	}    
	public void function removeSku(any sku) {    
		if(!structKeyExists(arguments, "sku")) {    
			arguments.sku = variables.sku;    
		}    
		var index = arrayFind(arguments.sku.getAttributeValues(), this);    
		if(index > 0) {    
			arrayDeleteAt(arguments.sku.getAttributeValues(), index);    
		}    
		structDelete(variables, "sku");    
	}
	
	// Vendor (many-to-one)
	public void function setVendor(required any vendor) {
		variables.vendor = arguments.vendor;
		if(isNew() or !arguments.vendor.hasAttributeValue( this )) {
			arrayAppend(arguments.vendor.getAttributeValues(), this);
		}
	}
	public void function removeVendor(any vendor) {
		if(!structKeyExists(arguments, "vendor")) {
			arguments.vendor = variables.vendor;
		}
		var index = arrayFind(arguments.vendor.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.vendor.getAttributeValues(), index);
		}
		structDelete(variables, "vendor");
	}
	
	// Vendor Order (many-to-one)
	public void function setVendorOrder(required any vendorOrder) {
		variables.vendorOrder = arguments.vendorOrder;
		if(isNew() or !arguments.vendorOrder.hasAttributeValue( this )) {
			arrayAppend(arguments.vendorOrder.getAttributeValues(), this);
		}
	}
	public void function removeVendorOrder(any vendorOrder) {
		if(!structKeyExists(arguments, "vendorOrder")) {
			arguments.vendorOrder = variables.vendorOrder;
		}
		var index = arrayFind(arguments.vendorOrder.getAttributeValues(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.vendorOrder.getAttributeValues(), index);
		}
		structDelete(variables, "vendorOrder");
	}
	
	// =============  END:  Bidirectional Helper Methods ===================
	
	// ============== START: Overridden Implicet Getters ===================
	
	public any function getAttributeValue() {
		if(structKeyExists(variables, "attributeValue") && len(variables.attributeValue)) {
			return variables.attributeValue;
		}
		if(structKeyExists(variables, "attributeValueEncrypted") && len(variables.attributeValueEncrypted)) {
			if(!isNull(getAttribute().getDecryptValueInAdminFlag()) && getAttribute().getDecryptValueInAdminFlag()) {
				return decryptValue(variables.attributeValueEncrypted);	
			}
			return "********";
		}
		
		return "";
	}
	
	// ==============  END: Overridden Implicet Getters ====================
	
	// ================== START: Overridden Methods ========================
	
	public void function preInsert(){
		if(getAttribute().getAttributeType().getSystemCode() == "atPassword" && structKeyExists(variables, "attributeValue")) {
			variables.attributeValueEncrypted = encryptValue(variables.attributeValue);
			structDelete(variables, "attributeValue");
		}
		
		super.preInsert();
	}
	
	public void function preUpdate(struct oldData){
		if(getAttribute().getAttributeType().getSystemCode() == "atPassword" && structKeyExists(variables, "attrubuteValue")) {
			variables.attributeValueEncrypted = encryptValue(variables.attributeValue);
			structDelete(variables, "attributeValue");
		}
		
		super.preUpdate(argumentcollection=arguments);
	}
	
	// ==================  END:  Overridden Methods ========================
		
	// =================== START: ORM Event Hooks  =========================
	
	// ===================  END:  ORM Event Hooks  =========================
}
