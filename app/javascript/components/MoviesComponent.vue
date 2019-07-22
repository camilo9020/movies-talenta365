<template>
  <div class="pusher">
    <div class="ui two column grid">
      <div class="row">
        <div class="ui success message" v-if="successMessage">
          {{ successMessage }}
        </div>
      </div>
      <div class="row">
          <div class="column">
            <div class="ui left floated">
              <h1>Peliculas</h1>
            </div>
          </div>
          <div class="column">
            <button class="ui right floated primary button" @click="openCreateMovieModal">
                <i class="plus icon"></i> Crear nueva pelicula
            </button>
          </div>
          <create-movie :selectedDate="selectedDate" @success="updateSuccessMessage"></create-movie>
      </div>
      <div class="row">
        <div class="ui form">
          <div class="inline fields">
            <div class="field">
              <label for="date">Seleccionar fecha</label>
              <input type="date" placeholder="" v-model="selectedDate" @change="changeDate">
            </div>
          </div>
        </div>
      </div>
      <create-reservation :movieFunctionId="selectedMovieId"  @success="updateSuccessMessage"></create-reservation>
    </div>
    <div class="ui stackable four column grid"  v-if="movieFunctions.length > 0">
      <movie-item v-for="(movie, index) in movieFunctions" :key="movie.id" :movie="movie" :index="index" @openModal="openReservationModal">
      </movie-item>
    </div>
    <div class="row" v-if="movieFunctions.length === 0">
      <div class="ui info message">
        No hay funciones para esta fecha
      </div>
    </div>
  </div>
</template>

<script>
  import MovieItem from './MovieItem.vue';
  import CreateMovie from './CreateMovie.vue';
  import CreateReservation from './CreateReservation.vue';
  import { sharedMethods } from '../shared/SharedMethods';
  export default {
    data: function () {
      return {
        movieFunctions: {},
        selectedDate: sharedMethods.formatedDate(new Date()),
        selectedMovieId: null,
        successMessage: null
      }
    },
    components: {
      MovieItem, CreateMovie, CreateReservation
    },
    created() {
      this.getMovieFunctions(this.selectedDate)
    },
    methods: {
      getMovieFunctions(date) {
        var url_request = '/api/v1/movie_functions/' + date
        this.$http.get(url_request).then((response) => {
          this.movieFunctions = response.body.movie_functions
        })
      },
      openCreateMovieModal() {
        $('.ui.modal.create-movie')
          .modal('show')
        ;
        $('.ui.dropdown').dropdown({
          allowAdditions: true,
        });
      },
      openReservationModal(id) {
        this.selectedMovieId = id
        $('.ui.modal.create-reservation')
          .modal('show')
      },
      changeDate() {
        this.getMovieFunctions(this.selectedDate)
      },
      updateSuccessMessage(message) {
        this.successMessage = message
        setTimeout(() => {
           this.successMessage = null
        }, 3000);
      }
    },
    updated: ()=>{
      $('.special.cards .image').dimmer({
        on: 'hover'
      });
    }
  }
</script>

<style>

</style>
