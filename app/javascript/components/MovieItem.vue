<template>
  <div class="column">
    <div class="ui special cards">
      <div class="card">
        <div class="blurring dimmable image">
          <div class="ui dimmer">
            <div class="content">
              <div class="center">
                <div class="ui inverted button" @click="openModal">Reservar</div>
              </div>
            </div>
          </div>
          <img :src="movie.url_imagen">
        </div>
        <div class="content">
          <a class="header">{{ movie.name }}</a>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    props: ['movie'],
    methods: {
      openModal() {
        this.$emit('openModal', this.movie.id);
      }
    }
  }
</script>
<style>
  .movie-item.image {
    height: 300px;
  }
</style>
