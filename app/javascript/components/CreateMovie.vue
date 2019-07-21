<template>
  <div class="ui tiny modal create-movie">
    <i class="close icon"></i>
    <div class="header">
      Crear Pelicula
    </div>
    <div class="content">
      <div class="description">
        <div class="row">
          <div class="col-12">
            <form action="" class="ui form">
              <div class="inline field">
                <label>Titulo</label>
                <input type="text" class="" v-model="name">
              </div>
              <div class="inline field">
                <label>Sinopsis</label>
                <input type="text" v-model="description">
              </div>
              <div class="inline field">
                <label>Poster url</label>
                <input type="text" v-model="url_imagen">
              </div>
              <div class="inline field">
                <label>fechas</label>
                <select multiple="" class="ui search dropdown" id="dates" v-model="function_dates">
                  <option :value="this.selectedDate">{{ this.selectedDate }}</option>
                </select>
                <div class="ui info message">
                  Puedes agregar varias fechas de funciones, utilizando el formato yyyy-mm-dd y oprimiendo tab
                </div>
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
        @click.prevent="submitForm()"
        :disabled="missingData">
        <i class="plus icon"></i> Crear nueva pelicula
      </button>

    </div>
  </div>
</template>

<script>
  export default {
    props: ['selectedDate'],
    data: function() {
      return {
        name: null,
        description: null,
        url_imagen: null,
        function_dates: [],
      }
    },
    methods: {
      submitForm() {
        debugger;
        let movieJsonData = { name: this.name, description: this.description, url_imagen: this.url_imagen, function_dates: this.function_dates }
        $.ajax({
          method: 'POST',
          url: 'api/v1/movies',
          dataType: "application/json",
          data: { movie : movieJsonData }
        }).done((response) => {
          this.resetForm()
          $('.close.icon').click()
        }).fail((error) => {
          this.resetForm()
          console.log(error)
        })
      },
      resetForm() {
        var self = this;
        Object.keys(this.data.form).forEach(function(key,index) {
          self.data.form[key] = '';
        });
      }
    },
    computed: {
      missingData() {
        if (this.name && this.description && this.url_imagen && this.function_dates.length > 0) {
          return false;
        }
        return true
      }
    }
  }
</script>
<style lang="scss">
 .field {
   label {
     width: 70px !important;
   }

   input, .selection.dropdown {
     width: 70% !important;
   }
  }
</style>
