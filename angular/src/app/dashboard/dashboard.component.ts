import { Component } from '@angular/core';

@Component({
  selector: 'app-dashboard',
  template: `
    <app-host-dashboard *abpPermission="'BookStore.Dashboard.Host'"></app-host-dashboard>
    <app-tenant-dashboard *abpPermission="'BookStore.Dashboard.Tenant'"></app-tenant-dashboard>
  `,
})
export class DashboardComponent {}
