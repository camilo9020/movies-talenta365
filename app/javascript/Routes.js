import ReservationsComponent from './components/ReservationsComponent.vue';
import MoviesComponent from './components/MoviesComponent.vue';

export const routes = [
  {
    path: '/',
    component: MoviesComponent
  },
  {
    path: '/reservations',
    component: ReservationsComponent
  }
]