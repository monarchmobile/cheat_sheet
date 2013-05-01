dir(Array)

script junkie prototypes and inheritance in javascript

// object length
 

// getter and setter
getProductData: function() {
            return value;
},

setProductData: function(val) {
  for (var k in val) {
      value[k] = val[k];
  }
},



// set value object by handle
setProductData: function(handle, data) {
 
    for (key in data) {
        value[handle][key] = data[key]
        console.log(value[handle][key])
    }  
},

goToNextItem: function(type) {
      next_item = Collection.util.next_item(type)
      console.log(next_item)
      self = this
      $("."+next_item).show()
      Collection[next_item].init({
            collection_details: self.collection_details,
            product_index: self.product_index,
            product_type: next_item
      })
}
