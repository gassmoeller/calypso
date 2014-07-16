!>@file   legendre_transform_lgloop.f90
!!@brief  module legendre_transform_lgloop
!!
!!@author H. Matsui
!!@date Programmed in Aug., 2007
!!@n    Modified in Apr. 2013
!
!>@brief  Legendre transforms
!!       (longest loop version)
!!
!!
!!@verbatim
!!      subroutine leg_backward_trans_long(ncomp, nvector, nscalar)
!!        Input:  sp_rlm   (Order: poloidal,diff_poloidal,toroidal)
!!        Output: vr_rtm   (Order: radius,theta,phi)
!!
!!    Forward transforms
!!      subroutine leg_forward_trans_long(ncomp, nvector, nscalar)
!!        Input:  vr_rtm   (Order: radius,theta,phi)
!!        Output: sp_rlm   (Order: poloidal,diff_poloidal,toroidal)
!!@endverbatim
!!
!!@param   ncomp    Total number of components for spherical transform
!!@param   nvector  Number of vector for spherical transform
!!@param   nscalar  Number of scalar (including tensor components)
!!                  for spherical transform
!
      module legendre_transform_lgloop
!
      use m_precision
!
      implicit none
!
! -----------------------------------------------------------------------
!
      contains
!
! -----------------------------------------------------------------------
!
      subroutine leg_backward_trans_long(ncomp, nvector, nscalar)
!
      use legendre_bwd_trans_lgloop
      use merge_polidal_toroidal_v
!
      integer(kind = kint), intent(in) :: ncomp, nvector, nscalar
!
!
      call clear_bwd_legendre_trans(ncomp)
      call legendre_b_trans_vector_long(ncomp, nvector)
      call legendre_b_trans_scalar_long(ncomp, nvector, nscalar)
!
!      call const_vect_sph_b_trans(ncomp, nvector)
!
      end subroutine leg_backward_trans_long
!
! -----------------------------------------------------------------------
!
      subroutine leg_forward_trans_long(ncomp, nvector, nscalar)
!
      use legendre_fwd_trans_lgloop
      use merge_polidal_toroidal_v
!
      integer(kind = kint), intent(in) :: ncomp, nvector, nscalar
!
!
!      call prod_r_vect_sph_f_trans(ncomp, nvector)
!
      call legendre_f_trans_vector_long(ncomp, nvector)
      call legendre_f_trans_scalar_long(ncomp, nvector, nscalar)
!
      end subroutine leg_forward_trans_long
!
! -----------------------------------------------------------------------
!
      end module legendre_transform_lgloop
