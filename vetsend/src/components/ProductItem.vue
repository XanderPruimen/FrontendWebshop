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
                   background-color: white; " @add-to-shoppingcart="addShoppingCart(item)"
               :ItemImage="item.productImage"
               :ItemInfo="item.productDescription"
               :ProductName="item.productName"
               
               :ProductPrice="item.productPrice"
               :ProductID="item.productId">Add to Shoppingcart</a>
               </div>
             </div>
           </router-link>
       </div>
       <router-view
         v-on:setItemInCart="setShoppingCart"/>
   </template>
     
   
   
   <script>
   
   import axios from "axios";
   
   export default {
     
     data(){
       return{
           items:[],
           
           
       }
     },
     methods:{

       refreshData(){
         axios.get('https://localhost:44334/api/Product')
         .then((response)=>{
           this.items= response.data;
           
           
         });
       },
       addShoppingCart(item){
         console.log(item);
         if (item){
           this.$emit('setItemInCart', item);
         }
       },
   
      //  toCart(){
      //    var obj = new Item(this.item[0].itemID,this.item[0].itemName, this.item[0].itemPrice, this.item[0].itemImage, this.item[0].itemInfo);
      //    this.$emit('setItemInCart', obj);
      //  }
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