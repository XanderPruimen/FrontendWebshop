<template>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active" >
                <img class="d-block w-100" src="../assets/Discountdog2.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <!-- <h5>My Caption Title (1st Image)</h5>
                    <p>The whole caption will only show up if the screen is at least medium size.</p> -->
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="../assets/Discountdog3.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="../assets/Discountcat.jpg" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div>
        <ChatbotMenu></ChatbotMenu>
    </div>
      <!-- <div class="home">
      
      
     
    
        <img alt="Vue logo" src="../assets/logo.png">
        <HelloWorld msg="Welcome to Your Vue.js App"/>
      </div> -->
      
    </template>
    
    <script>

    import ChatbotMenu from '../../src/components/ChatbotMenu.vue';
    
    export default {
      name: 'HomeView',
      components: {
      ChatbotMenu
  }
    }

    
    </script>
