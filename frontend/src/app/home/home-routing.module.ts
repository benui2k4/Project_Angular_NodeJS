import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RouteGuardService } from 'src/app/services/routeGuard/route-guard-service.service';
import { NoAuthComponent } from './no-auth/no-auth.component';
import { AboutComponent } from './about/auth-required.component';
import { HomeComponent } from './home.component';
import {ContactComponent} from './contact/contact.component'
import {ShopComponent} from './shop/shop.component'
import { SerchComponent } from './serch/serch.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  {
    path: '',
    canActivate: [RouteGuardService],
    data: {
      expectedRole: ['admin', 'user'],
    },
    component: HomeComponent,
  },
  {
    path: 'about',
    canActivate: [RouteGuardService],
    data: {
      expectedRole: ['admin', 'user'],
    },
    component: AboutComponent,
  },
  {
    path: 'shop',
    canActivate: [RouteGuardService],
    data: {
      expectedRole: ['admin', 'user'],
    },
    component: ShopComponent,
  },
  {
    path: 'serch',
    canActivate: [RouteGuardService],
    data: {
      expectedRole: ['admin', 'user'],
    },
    component: SerchComponent,
  },
  {
    path: 'contact',
    canActivate: [RouteGuardService],
    data: {
      expectedRole: ['admin', 'user'],
    },
    component: ContactComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class HomeRoutingModule {}
