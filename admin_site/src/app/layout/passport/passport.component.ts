import { Component } from '@angular/core';

@Component({
  selector: 'layout-passport',
  templateUrl: './passport.component.html',
  styleUrls: ['./passport.component.less'],
})
export class LayoutPassportComponent {
  links = [
    {
      title: '办公',
      href: 'http://www.mgjtoa.com/login/Login.jsp',
    },
    {
      title: '监控',
      href: 'http://192.168.122.119/zabbix.php?action=dashboard.view',
    },
    {
      title: '邮箱',
      href: 'http://mail.xy-cloud.com/coremail/',
    },
  ];
}
