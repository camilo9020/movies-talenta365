<template>
  <div id="app" class="">
    <div class="ui visible sidebar inverted vertical menu">
      <div class="item">
        <h1><strong>Place</strong>it</h1>
      </div>
      <a class="item">
        <router-link to="/"><span> <i class="calendar outline icon"></i>Peliculas</span></router-link>
      </a>
      <a class="item">
        <router-link to="/reservations"><span> <i class="film icon"></i>Reservas</span></router-link>
      </a>
    </div>

    <router-view></router-view>

  </div>

</template>
<script>
export default {
}
</script>
<style>
  .ui.inverted.menu {
    background: #3394e0;
  }
  .pusher {
    margin-left: 250px;
    margin-right: 100px;
  }
</style>
