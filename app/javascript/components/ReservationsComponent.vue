<template>
  <div class="pusher">
    <h1>Reservas realizadas</h1>
    <div class="ui two column grid">
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
    </div>
    <div class="row">
      <div class="ui info message" v-if="reservations.length === 0">
        No hay reservas para este día
      </div>
      <table class="ui celled table" v-if="reservations.length > 0">
        <thead>
          <tr><th>Pelicula</th>
          <th>Nombre reservante</th>
          <th>Correo electronico</th>
          <th>Cedula</th>
        </tr></thead>
        <tbody>
          <tr v-for="reservation in reservations" :key="reservation.id">
            <td>
              {{reservation.movie_name }}
            </td>
            <td>
              {{ reservation.name }}
            </td>
            <td>
              {{ reservation.email }}
            </td>
            <td>
              {{ reservation.identification_number}}
            </td>
          </tr>
        </tbody>
      </table>

    </div>
  </div>
</template>
<script>
import { sharedMethods } from '../shared/SharedMethods';
export default {
  data() {
    return {
      selectedDate: sharedMethods.formatedDate(new Date()),
      reservations: []
    }
  },
  created() {
    this.getReservations(this.selectedDate);
  },

  methods: {
    getReservations(date) {
      var url_request = '/api/v1/reservations?date=' + date
      this.$http.get(url_request).then((response) => {
        this.reservations = response.body.reservations
      })
    },
    changeDate() {
      this.getReservations(this.selectedDate)
    },
  }
}
</script>
