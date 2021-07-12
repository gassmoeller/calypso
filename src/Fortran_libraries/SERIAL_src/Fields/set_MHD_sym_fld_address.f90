!>@file   set_MHD_sym_fld_address.f90
!!        module set_MHD_sym_fld_address
!!
!! @author H. Matsui
!! @date   Programmed on July, 2006
!! @n      Modified  on Jan., 2012
!!
!!
!> @brief Set start address for field data
!!
!!@verbatim
!!      logical function check_sym_vector_fields(phys_name_ctl)
!!      logical function check_sym_scalar_fields(phys_name_ctl)
!!      logical function check_sym_sym_tensor_fields(phys_name_ctl)
!!        character(len = kchara), intent(in) :: phys_name_ctl
!!
!!      subroutine set_MHD_sym_field_addresses                       &
!!     &          (i_fld, field_name, iphys, flag)
!!      integer(kind = kint), intent(in) :: num_field
!!      integer(kind = kint), intent(in) :: istack_component(0:num_field)
!!      character(len = kchara), intent(in) :: field_name(num_field)
!!      type(SGS_model_addresses), intent(inout) :: iphys
!!@endverbatim
!!
!!@n @param num_field                 number of field
!!@n @param num_component(num_field)  number of components of field
!!@n @param field_name(num_field)     list of field names
!!@n @param iphys                     structure of field addresses
!
      module set_MHD_sym_fld_address
!
      use m_precision
!
      use t_phys_address
      use t_phys_data
!
      implicit none
!
! -----------------------------------------------------------------------
!
      contains
!
! -----------------------------------------------------------------------
!
!       logical function check_sym_vector_fields(phys_name_ctl)
! !
!       use m_field_w_symmetry_labels
!       use m_force_w_sym_labels
! !
!       character(len = kchara), intent(in) :: phys_name_ctl
!       logical :: flag
! !
!       flag =  check_sym_vector(phys_name_ctl)                        &
!       &   .or. check_sym_force(phys_name_ctl)
! !
!       check_sym_vector_fields = flag
! !
!       end function check_sym_vector_fields
!
! -----------------------------------------------------------------------
! -----------------------------------------------------------------------
! !
!       logical function check_sym_scalar_fields(phys_name_ctl)
! !
!       use m_field_w_symmetry_labels
!       use m_force_w_sym_labels
! !     use m_sym_ene_flux_labels
! !
!       character(len = kchara), intent(in) :: phys_name_ctl
!       logical :: flag
! !
!       flag =  check_sym_scalar(phys_name_ctl)                        &
!       &   .or. check_sym_scalar_flux(phys_name_ctl)                 
! !    &   .or. check_sym_enegy_fluxes(phys_name_ctl)
! !
!       check_sym_scalar_fields = flag
! !
!       end function check_sym_scalar_fields
!
! -----------------------------------------------------------------------
!
!       logical function check_sym_sym_tensor_fields(phys_name_ctl)
! !
!       use m_force_w_sym_labels
! !
!       character(len = kchara), intent(in) :: phys_name_ctl
!       logical :: flag
! !
!       flag =  check_sym_flux_tensor(phys_name_ctl)
! !
!       check_sym_sym_tensor_fields = flag
! !
!       end function check_sym_sym_tensor_fields
!
! -----------------------------------------------------------------------
! -----------------------------------------------------------------------
!
      subroutine set_MHD_sym_field_addresses                         &
      &          (i_fld, field_name, iphys, flag)
!
      use set_sym_field_labels
      use set_sym_force_labels
      use m_force_w_sym_labels
!
      integer(kind = kint), intent(in) :: i_fld
      character(len = kchara), intent(in) :: field_name
!
      type(phys_address), intent(inout) :: iphys
!
      logical, intent(inout) :: flag
!
!
      call set_sym_field_addresses                                   &
      &   (i_fld, field_name, iphys%sym_fld, flag)
      if(flag) return
!
      call set_asym_field_addresses                                   &
      &   (i_fld, field_name, iphys%asym_fld, flag)
      if(flag) return
!
!
      call set_sym_sym_force_addresses                                 &
      &   (i_fld, field_name, iphys%forces_by_sym_sym, flag)
      if(flag) return
!
      call set_asym_asym_force_addresses                                 &
      &   (i_fld, field_name, iphys%forces_by_asym_asym, flag)
      if(flag) return
!
      call set_sym_asym_force_addresses                                 &
      &   (i_fld, field_name, iphys%forces_by_sym_asym, flag)
      if(flag) return
!
      call set_asym_sym_force_addresses                                 &
      &   (i_fld, field_name, iphys%forces_by_asym_sym, flag)
      if(flag) return
!
!
      end subroutine set_MHD_sym_field_addresses
!
!  --------------------------------------------------------------------
!
      end module set_MHD_sym_fld_address
