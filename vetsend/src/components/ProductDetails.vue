<template>
    <div class="container">
    <section class="mb-5">
   
     <div class="row">
       <div class="col-md-6 mb-4 mb-md-0">
   
         <div id="mdb-lightbox-ui"></div>
   
         <div class="mdb-lightbox">
   
           <div class="row product-gallery mx-1">
   
             <div class="col-12 mb-0">
               <figure class="view overlay rounded z-depth-1 main-img">
                 
                   <!-- <img :src="(product[0].productImage)"
                     class="img-fluid z-depth-1"> -->
                
               </figure>

             </div>

           </div>
   
         </div>
   
       </div>
       <div class="col-md-6">
   
         <h5>{{this.product[0].productName}}</h5>
         <p class="mb-2 text-muted text-uppercase small">Vetsend</p>
         
         <p><span class="mr-1"><strong>${{this.product[0].productPrice}}</strong></span></p>
         <p class="pt-1">{{this.product[0].productDescription}}</p>
         <div class="table-responsive">
           <table class="table table-sm table-borderless mb-0">
             <tbody>
               <tr>
                 <th class="pl-0 w-25" scope="row"><strong>Model</strong></th>
                 <td>Shirt 5407X</td>
               </tr>
               <tr>
                 <th class="pl-0 w-25" scope="row"><strong>Color</strong></th>
                 <td>Black</td>
               </tr>
               <tr>
                 <th class="pl-0 w-25" scope="row"><strong>Delivery</strong></th>
                 <td>USA, Europe</td>
               </tr>
             </tbody>
           </table>
         </div>
         <hr>

         <button type="button" class="btn btn-light" style="border-top: 5px solid #9EEB47; border-bottom: 5px solid #9EEB47;
             background-color: white; " @click.self="toCart()">
           <i class="material-icons" >add_shopping_cart</i> Add to cart</button>
       </div>
     </div>
   
   </section>   
   
    </div>
   </template>
   <script>
   
   import axios from "axios";
   import Product from "../classes/product";
   export default {
     name: "ProductDetails",
     
     data(){
       return{
         productID: Number,
         productName: "",
         product: [],
       };
     },

     created(){
       this.productID = this.$route.params.productID;
       this.refreshData();
     },
     methods:{
       refreshData(){
         axios.get('https://localhost:44334/api/Product'+ this.productID)
             .then((response) => {
               this.product = response.data;
               console.log(this.product[0])
               
             })
       },
       toCart(){
         //console.log(this.ProductDescription);
         var obj = new Product(this.product[0].productID,this.product[0].productName, this.product[0].productPrice, this.product[0].productImage, this.product[0].productDescription);
         this.$emit('setItemInCart', obj);
       }
     },
   };
   
   </script>