import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RouteGuardService } from 'src/app/services/routeGuard/route-guard-service.service';
import { NoAuthComponent } from './no-auth/no-auth.component';
import { AuthRequiredComponent } from './auth-required/auth-required.component';

const routes: Routes = [
  { path: 'no-auth', component: NoAuthComponent },
  {
    path: 'auth-required',
    canActivate: [RouteGuardService],
    data: {
      expectedRole: ['admin', 'user'],
    },
    component: AuthRequiredComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class HomeRoutingModule {}
