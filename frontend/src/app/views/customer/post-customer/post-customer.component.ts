import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AccountService } from 'src/app/services/account.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-post-customer',
  templateUrl: './post-customer.component.html',
  styleUrls: ['./post-customer.component.scss']
})
export class PostCustomerComponent {
  customerFormPost: any = FormGroup;
  responseMessage: any;

  constructor(private formBuilder: FormBuilder, private router: Router, private account: AccountService) { };
  ngOnInit(): void {
    this.customerFormPost = this.formBuilder.group({
      name: ['', [Validators.required]],
      email: ['', [Validators.required]],
      password: ['', [Validators.required]],
    })
  }

  handleSubmit() {
    let formData = this.customerFormPost.value;
    let data = {
      name: formData.name,
      email: formData.email,
      password: formData.password
    }
  console.log(data);

  }
}
