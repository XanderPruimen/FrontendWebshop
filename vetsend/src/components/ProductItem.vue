/* eslint-disable */
<template> 
    <!-- <div class="row"> -->
       <div class="card-deck"  >
           <router-link v-for="item in items" :key="item.ItemID" :to="{ name: 'itemDetails', params: { id: item.ItemID} }">
             <div class="card" style="width: 18rem; height: 25em;">
               <img :src="(item.ItemImage)" class="card-img-top imagesize" alt="Test">
               <div class="card-body">
                 <h5 class="card-title">{{item.ItemName}}</h5>
                 <h6 class="card-text">${{item.ItemPrice}}</h6>
                 <p class="card-text">{{item.ItemInfo}}</p>
                 <a href="#" class="btn btn-light addToCart" style="border-top: 5px solid #d9322b; border-bottom: 5px solid #0f6fb7;
                 background-color: white; " @add-to-shoppingcart="addShoppingCart(item)"
               :ItemImage="item.ItemImage"
               :ItemDescription="item.ItemInfo"
               :ItemTitle="item.ItemName"
               
               :ItemPrice="item.ItemPrice"
               :ItemID="item.ItemID">Add to Shoppingcart</a>
               </div>
             </div>
           </router-link>
       </div>
       <router-view
         v-on:setItemInCart="setShoppingCart"/>
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
         axios.get('https://localhost:7235/api/Item')
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
       /* eslint-disable */
       toCart(){
         var obj = new Item(this.item[0].ItemID,this.item[0].ItemName, this.item[0].ItemPrice, this.item[0].ItemImage, this.item[0].ItemDescription);
         this.$emit('setItemInCart', obj);
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