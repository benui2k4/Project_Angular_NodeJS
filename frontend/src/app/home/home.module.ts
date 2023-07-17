import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeRoutingModule } from './home-routing.module';
import { NoAuthComponent } from './no-auth/no-auth.component';
import { AuthRequiredComponent } from './auth-required/auth-required.component';

@NgModule({
  imports: [HomeRoutingModule, CommonModule],
  declarations: [
    NoAuthComponent,
    AuthRequiredComponent
  ],
})
export class HomeModule {}
