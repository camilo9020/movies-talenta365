<template>
  <div class="ui tiny modal create-reservation">
    <i class="close icon"></i>
    <div class="header">
      Reservar
    </div>
    <div class="content">
      <div class="description">
        <div class="row">
          <error-messages :errors="errors" v-if="errors"></error-messages>
          <div class="col-12">
            <form action="" class="ui form">
              <div class="inline field">
                <label>Nombre completo</label>
                <input type="text" class="" v-model="name">
              </div>
              <div class="inline field">
                <label>Cedula</label>
                <input type="text" v-model="identification_number">
              </div>
              <div class="inline field">
                <label>Correo electronico</label>
                <input type="text" v-model="email">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="actions">
      <button
        type="submit"
        class="ui primary button"
        @click.prevent="submitForm"
        :disabled="missingData">
        <i class="plus icon"></i> Reservar ahora
      </button>
    </div>
  </div>
</template>
<script>
  import ErrorMessages from './ErrorMessages.vue';
  export default {
    props: ['movieFunctionId'],
    components: { ErrorMessages },
    data() {
      return {
        name: null,
        email: null,
        identification_number: null,
        errors: null
      }
    },
    methods: {
      submitForm(event) {
        let reservationJsonData = { name: this.name, email: this.email, identification_number: this.identification_number, movie_function_id: this.movieFunctionId }
        $.post('api/v1/reservations.js',{ reservation : reservationJsonData }).done((response) => {
          this.hideModal()
          this.resetForm()
          this.reservationCreated()
        }).fail((errors) => {
          this.errors = errors.responseJSON.errors
        })
      },
      resetForm() {
        Object.assign(this.$data, this.$options.data.apply(this))
      },
      hideModal() {
        $('.ui.modal.create-reservation').modal('hide')
      },
      reservationCreated() {
        this.$emit('success', 'La Reservación fue creada exitosamente')
      }
    },
    computed: {
      missingData() {
        if (this.name && this.email && this.identification_number) {
          return false;
        }
        return true
      }
    }
  }
</script>
<style scoped lang="scss">
  .field {
   label {
     width: 111px !important;
   }

   input, .selection.dropdown {
     width: 70% !important;
   }
  }
</style>
