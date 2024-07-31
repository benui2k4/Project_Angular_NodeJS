import { INavData } from '@coreui/angular';

export const navItems: INavData[] = [
  {
    name: 'Account Admin',
    url: '/admin/read-admin',
    iconComponent: { name: 'cilPeople' },
  },
  {
    name: 'Category',
    url: '/category/read-category',
    iconComponent: { name: 'cilList' },
  },
  {
    name: 'Room',
    url: '/product/read-product',
    iconComponent: { name: 'cilCursor' },
  },
  {
    name: 'Customer',
    url: '/customer/read-customer',
    iconComponent: { name: 'cilSpeech' },
  },
];
