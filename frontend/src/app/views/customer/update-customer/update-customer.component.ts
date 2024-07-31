import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import  { AccountService } from '../../../services/account.service'

@Component({
  selector: 'app-update-customer',
  templateUrl: './update-customer.component.html',
  styleUrls: ['./update-customer.component.scss']
})
export class UpdateCustomerComponent {
  customerFormUpdate = new FormGroup({
    name: new FormControl(''),
    email: new FormControl(''), 
  });
  responseMessage: any;

  constructor(private customerService: AccountService, private route: ActivatedRoute, private router: Router){ };
  
  ngOnInit(): void {
    this.customerService.getOneAdmin(this.route.snapshot.params['id']).subscribe((response: any) => {
      this.customerFormUpdate = new FormGroup ({
        name: new FormControl(response[0].name),
        email: new FormControl(response[0].email), 
      });
    });
  }

  handleSubmit(){
    let formData = this.customerFormUpdate.value;
    let data = {
      name: formData.name,
      email: formData.email, 
    }
    this.customerService.updateAdmin(this.route.snapshot.params['id'], data).subscribe((response: any) => {
      this.responseMessage = response?.message;
      this.router.navigate(['/customer/read-customer'])
    })
  }
}
