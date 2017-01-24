"use strict";

var productController = require('../controllers/product');


module.exports = function () {
    return [
        {
            method: 'GET',
            path: '/products/{product_id}',
            handler: productController.findByID
        },
	// My notes: From his Github, this was not commented out (representing final state), but I am commenting 
	//           out initially, to be more like his overall flow, where in the video, it was commented because
	//           he uncomments it at the end to use Github changes triggering new flows, etc.
        // {
        //     method: 'GET',
        //     path: '/products/title/{title}',
        //     handler: productController.findByName
        // },
        {
            method: 'GET',
            path: '/products',
            handler: productController.find
        }
    ];
}();
