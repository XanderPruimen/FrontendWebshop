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
                 
                   <img :src="(item[0].ItemImage)"
                     class="img-fluid z-depth-1">
                
               </figure>

             </div>

           </div>
   
         </div>
   
       </div>
       <div class="col-md-6">
   
         <h5>{{this.item[0].ItemName}}</h5>
         <p class="mb-2 text-muted text-uppercase small">CarParts</p>
         
         <p><span class="mr-1"><strong>${{this.item[0].ItemPrice}}</strong></span></p>
         <p class="pt-1">{{this.item[0].ItemInfo}}</p>
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

         <button type="button" class="btn btn-light" style="border-top: 5px solid #d9322b; border-bottom: 5px solid #0f6fb7;
           background-color: white; " @click.self="toCart()">
           <i class="material-icons" >add_shopping_cart</i> Add to cart</button>
       </div>
     </div>
   
   </section>   
   
    </div>
   </template>
   <script>
   
   import axios from "axios";
   import Item from "../classes/Item";
   export default {
     name: "ItemDetails",
     
     data(){
       return{
         id: Number,
         itemNAME: "",
         item: [],
       };
     },

     created(){
       this.ItemID = this.$route.params.ItemID;
       this.refreshData();
     },
     methods:{
       refreshData(){
         axios.get('https://localhost:7235/api/Item'+ this.ItemID)
             .then((response) => {
               this.item = response.data;
               console.log(this.item[0])
               
             })
       },
       toCart(){
         //console.log(this.ProductDescription);
         var obj = new Item(this.item[0].ItemID,this.item[0].ItemName, this.item[0].ItemPrice, this.item[0].ItemImage, this.item[0].ItemInfo);
         this.$emit('setItemInCart', obj);
       }
     },
   };
   
   </script>