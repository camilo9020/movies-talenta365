<template>
  <div class="ui error message" v-if="errors">
    Fallo la creación por lo siguientes:
    <ul>
      <li v-for="error in errors" :key="name">
        {{ error[0] }}
      </li>
    </ul>
  </div>

</template>
<script>
export default {
  props: ['errors']
}
</script>
