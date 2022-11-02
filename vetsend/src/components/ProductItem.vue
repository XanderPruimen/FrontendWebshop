/* eslint-disable */
<template> 
    <!-- <div class="row"> -->
       <div class="card-deck"  >
           <router-link v-for="item in items" :key="item.productID" :to="{ name: 'ProductDetails', params: { id: item.productID} }">
             <div class="card" style="width: 18rem; height: 25em;">
               <img :src="(item.productImage)" class="card-img-top imagesize" alt="Test">
               <div class="card-body">
                 <h5 class="card-title">{{item.productName}}</h5>
                 <h6 class="card-text">${{item.productPrice}}</h6>
                 <p class="card-text">{{item.productDescription}}</p>
                 <a href="#" class="btn btn-light addToCart" style="border-top: 5px solid #d9322b; border-bottom: 5px solid #0f6fb7;
     background-color: white; " @add-to-shoppingcart="addShoppingCart(product)"
               :ProductImage="item.productImage"
               :ProductDescription="item.productDescription"
               :ProductTitle="item.productName"
               
               :ProductPrice="item.productPrice"
               :ProductID="item.productID">Add to Shoppingcart</a>
               </div>
             </div>
           </router-link>
       </div>
       <router-view
         v-on:setProductInCart="setShoppingCart"/>
   </template>
     
   
   
   <script>
   
   export default {
     
     data(){
       return{
           items:[],
           
           
       }
     },
     methods:{
      /* eslint-disable */
       refreshData(){
         axios.get('https://localhost:44334/api/Product')
         .then((response)=>{
           this.items= response.data;
           
           
         });
       },
       addShoppingCart(product){
         console.log(product);
         if (product){
           this.$emit('setProductInCart', product);
         }
       },
       /* eslint-disable */
       toCart(){
         var obj = new Product(this.product[0].productID,this.product[0].productName, this.product[0].productPrice, this.product[0].productImage, this.product[0].productDiscription);
         this.$emit('setProductInCart', obj);
       }
     },
     mounted:function(){
       this.refreshData();
     },
   }
   </script>
   <style scoped>
   .container{
     display: flex;
     flex-wrap: wrap;
   }
   .container > div {
   padding: 10px;
   }
   .imagesize{
     height: 191px;
     width: 286px;
   }
   .addToCart{
     bottom: 0;
    text-align: end;
    
   }
   </style>