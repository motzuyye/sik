@extends('layouts.master')

@section('content')
@php
    $title = "";
    $logo = "no-logo.png";
    if( !is_null($aplikasi) ){
        $title = $aplikasi->nama;
        $logo = is_null($aplikasi->logo) || $aplikasi->logo == "" ? $logo : $aplikasi->logo;
    }
@endphp

<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<div class="row">
					<div class="col-md-12 clearfix">
						
						<h2>{{ $title }}</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<a class="btn btn-xs btn-success" href="/absensi/create" ><i class="fa fa-fax"></i> Hadir</a>
						
						<div class="clearfix"></div>
						@if ($message = Session::get('full_absen'))
							<div class="alert alert-info alert-block">
								<button type="button" class="close" data-dismiss="alert">×</button> 
								<strong>{{ $message }}</strong>
							</div>
						@endif
					</div>
				</div>
				
			</div>

			<div class="x_content">
				<div class="container-fluid">
					
					{{-- <div class="form-group row">
						<label class="control-label col-md-1 col-sm-1 col-xs-6">Tahun</label>
						<div class="col-md-2 col-sm-2 col-xs-6 ">
							<select id="filter-tahun" class="form-control">
								<option value="">Pilih Tahun</option>
								@foreach( $yearMonth['year'] as $m => $v )
									<option value="{{ $v }}">{{ $v }}</option>
								@endforeach
							</select>
						</div>
						<label class="control-label col-md-1 col-sm-1 col-xs-6">Bulan</label>
						<div class="col-md-2 col-sm-2 col-xs-6 ">
							<select id="filter-bulan" class="form-control">
								<option value="">Pilih Bulan</option>
								@foreach( $yearMonth['month'] as $m => $v )
									<option value="{{ $v['value'] }}" >{{ $v['name'] }}</option>
								@endforeach
							</select>
						</div>
					</div> --}}

					<div class="form-group col-md-5 col-sm-5 col-xs-12">
						<label class="control-label col-md-3 col-sm-3 col-xs-3">Periode</label>
						<div class="col-md-9 col-sm-9 col-xs-9">
						  <div class="control-group">
						    <div class="controls">
						      <div class="col-md-11 xdisplay_inputx form-group has-feedback">
						        <input type="text" class="form-control has-feedback-left" id="tahun-bulan" placeholder="Periode" name="periode" aria-describedby="inputPeriode" value="{{old('periode')}}">
						        <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
						        <span id="inputPeriode" class="sr-only">(success)</span>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
					
				</div>
				<table id="datatable-absensi" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>No.</th>
							<th>Nik</th>
							<th>Nama</th>
							<th>Tahun</th>
							<th>Bulan</th>
							<th>Tanggal</th>
							<th>Status</th>
							<th>Jam Masuk</th>
							<th>Jam Pulang</th>
							<th>Jarak</th>
							<th>Latitude</th>
							<th>Longitude</th>
							<th>Kantor</th>
							@if( auth()->user()->level == 'hrd' || auth()->user()->level == 'developer' )
							<th width="20%">Aksi</th>
							@endif
						</tr>
					</thead>
					<tbody>
						<?php $no=1; ?>
						@foreach($data as $d)
						<tr  >
							<td>{{ $no++ }}</td>
							<td>{{ str_pad( $d->pegawai['nik'] , 4, '0', STR_PAD_LEFT) }}</td>
							<td>{{ $d->pegawai['nama'] }}</td>
							<td>{{ $d->tahun }}</td>
							<td>{{ $d->nama_bulan }}</td>
							<td>{{ $d->tanggal }}</td>
							<td>{{ $d->status }}</td>
							<td>{{ $d->jam_masuk }}</td>
							<td>{{ $d->jam_pulang }}</td>
							<td>{{ ( $d->jarak ) }} Meter</td>
							<td>{{ $d->latitude }}</td>
							<td>{{ $d->longitude }}</td>
							<td>{{ $d->kantor['nama']  ?? '' }}</td>
							
							@if( auth()->user()->level == 'hrd' || auth()->user()->level == 'developer' )
							<td>

								<a href="/absensi/edit/{{ $d->id }}" class="btn btn-xs btn-warning {{ $d->has_gaji == '' || $d->has_gaji == null ? '' : 'disabled'  }} ><i class="fa fa-pencil-square-o"></i> Edit</a>
								<a href="/absensi/delete/{{ $d->id }}" class="btn btn-xs btn-danger {{ $d->has_gaji == '' || $d->has_gaji == null ? '' : 'disabled'  }} " onclick="return confirm('Apakah anda ingin menghapus data ini?');" data-popup="tooltip" data-original-title="Hapus Data"><i class="fa fa-trash"></i> Hapus</a>

							</td>
							@endif
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>

	</div>
</div>

@endsection

@push('script')

<script type="text/javascript">
	/*$.fn.dataTable.ext.search.push(
		function( settings, data, dataIndex ) {
			var filterTahun = parseInt( $('#filter-tahun').val(), 10 );
			var filterBulan = parseInt( $('#filter-bulan').val(), 10 );
			var tahun = parseFloat( data[3] ) || 0; // use data for the age column
			var bulan = parseFloat( data[4] ) || 0; // use data for the age column
			
			if ( 
				(
					isNaN( filterTahun ) ||
					( !isNaN( filterTahun ) && tahun == filterTahun )
					
				) && 
				(
					isNaN( filterBulan ) ||
					( !isNaN( filterBulan ) && bulan == filterBulan )
				)
			){
				return true;
			}
			return false;
		}
	);*/
	$filterPeriode = "";
	$.fn.dataTable.ext.search.push(
		function( settings, data, dataIndex ) {
			//var filterTahun = parseInt( $('#filter-tahun').val(), 10 );
			//var filterBulan = parseInt( $('#filter-bulan').val(), 10 );
			//var bulan = parseFloat( data[4] ) || 0; // use data for the age column
			var periode = $filterPeriode.split(" ");
			var filterTahun = parseInt( periode[0], 10 );
			var filterBulan = periode[1] || "";
			if(periode.length == 2 || $filterPeriode == ""){
				var tahun = parseFloat( data[3] ) || 0; // use data for the age column
				var bulan = data[4] || ""; // use data for the age column
				if ( 
					(
						isNaN( filterTahun ) ||
						( !isNaN( filterTahun ) && tahun == filterTahun )
						
					) && 
					(
						!isNaN( filterBulan ) ||
						( isNaN( filterBulan ) && bulan == filterBulan )
					)
				){
					return true;
				}
			}
			
			return false;
		}
	);

	$(document).ready(function() {
		var table = $('#datatable-absensi').DataTable({
			"columnDefs": [
				{
					"targets": [ 3,4 ],
					"visible": false
				}
			]
		});
		
		// Event listener to the two range filtering inputs to redraw on input
		$('#filter-tahun, #filter-bulan').change( function() {
			table.draw();
		} );

		$('#tahun-bulan').datetimepicker({
			format: "YYYY MMMM",
			viewMode: "months",
			toolbarPlacement: "top",
			showClear: true,
			showClose: true,
			useCurrent:false,
			date:null,
			collapse:false,
			widgetPositioning:{
				horizontal: 'auto',
				vertical: 'auto'
			},
			allowInputToggle: false,
			focusOnShow: false,
		})
		$("#tahun-bulan").on('dp.change', function(e){ 
			var formatedValue = $(this).val() == "" ? $(this).val() : e.date.format(e.date._f);
			$filterPeriode = formatedValue;
			table.draw();
		});
	} );
	
</script>
@endpush