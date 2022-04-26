@extends('layouts.app' )
@php
    $title = "";
    $logo = "no-logo.png";
    if( !is_null($aplikasi) ){
        $title = $aplikasi->nama;
        $logo = is_null($aplikasi->logo) || $aplikasi->logo == "" ? $logo : $aplikasi->logo;
    }
@endphp
@push('styles')
<link href="{{ asset('css/auth.css') }}" rel="stylesheet">
@endpush
@section('content')
<div class="col-md-4" style="text-align: center;">
  @if (Session::has('message'))
  <div class="alert alert-{{ Session::get('message_type') }}" role="alert">{{ Session::get('message') }}</div>
  @endif
</div>

<div class="tile animate">
  <div class="tile-header">
    {{-- <h2 style="color: white; opacity: .75; font-size: 4rem; display: flex; justify-content: center; align-items: center; height: 100%;">SIGN IN</h2> --}}
  </div>
  
  <div class="tile-body">
    <form id="form" method="POST" action="{{ route('login') }}">
		@csrf
	      <label class="form-input">
	        <i class="material-icons">person</i>
	        <input type="text" class="form-control {{ $errors->has('username') ? ' is-invalid' : '' }}" id="username" name="username" value="{{ old('username') }}" required autofocus />
	        <span class="label">Username</span>
	        <span class="underline"></span>
	        
	      </label>
	      <small class="form-input">
	      	@if ($errors->has('username'))
		        <span class="invalid-feedback text-danger" role="alert">
		          {{ $errors->first('username') }}
		        </span>
	        @endif
	      </small>
	      
	      <label class="form-input">
	        <i class="material-icons">lock</i>
	        <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required  />
	        <span class="label">Password</span>
	        <div class="underline"></div>
	        
	      </label>
	      <small class="form-input">
	      	@if ($errors->has('password'))
		        <span class="invalid-feedback text-danger" role="alert">
		          <strong>{{ $errors->first('password') }}</strong>
		        </span>
	        @endif
	      </small>
	      <div class="submit-container clearfix" style="margin-top: 2rem;">
	      	<button type="submit" class="btn btn-irenic float-right" tabindex="0">{{ __('Login') }}</button>
	        {{-- <div id="submit"  type="submit" class="btn btn-irenic float-right" tabindex="0">
	          <span>{{ __('Login') }}</span>
	        </div> --}}
	        
	        <div class="login-pending">
	          <div class=spinner>
	            <span class="dot1"></span>
	            <span class="dot2"></span>
	          </div>
	          
	          <div class="login-granted-content">
	            <i class="material-icons">done</i>
	          </div>
	        </div>
	      </div>
    </form>
  </div>
</div>

@endsection

@push('scripts')
<script>
	var $btn = document.getElementById("submit");
	var $form = document.getElementById("form")

	/*function signIn() {
	  if ($form.checkValidity()) {
	    $btn.classList.add('pending');
	    window.setTimeout(function(){ 
	    	$('#form').submit();
	    }, 1500);

	  }
	}

	$btn.addEventListener("click", signIn);*/
</script>
@endpush