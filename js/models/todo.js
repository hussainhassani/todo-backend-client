/*global Backbone */
var app = app || {};

(function () {
	'use strict';

	// Todo Model
	// ----------

	// Our basic **Todo** model has `title`, `order`, and `completed` attributes.
	app.Todo = Backbone.Model.extend({
		// Default attributes for the todo
		// and ensure that each todo created has `title` and `completed` keys.
		defaults: {
			title: '',
			completed: false
		},

    idAttribute: "url",

    url: function() { 
      if( this.isNew() ){
        return this.collection.url;
      }else{
        return this.get('url'); 
      }
    },

		// Toggle the `completed` state of this todo item.
		toggle: function () {
			this.save({
				title: this.get('title'),
				completed: !this.get('completed')
			},{patch:true});
		}
	});
})();
