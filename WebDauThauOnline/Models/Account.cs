﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebDauThauOnline.Models
{
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    public partial class Account
    {
        public int ID { get; set; }
        [Required(ErrorMessage = "Bắt buộc.")]
        [DisplayName("Tài khoản")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Bắt buộc.")]
        [DataType(DataType.Password)]
        [DisplayName("Mật khẩu")]
        public string Password { get; set; }
        public byte[] HashedPassword { get; set; }
        public byte[] Key { get; set; }
        [Required(ErrorMessage = "Bắt buộc.")]
        [DataType(DataType.Password)]
        [DisplayName("Xác nhận lại mật khẩu")]
        public string confirmPassword { get; set; }
        public string registerErrorMessage { get; set; }
        public string loginErrorMessage { get; set; }
        public int Admin { get; set; }

    }
}
