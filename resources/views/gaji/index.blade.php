@extends('layouts.master')

@section('content')
@php
    $title = "";
    $logo = "no-logo.png";
    if( !is_null($aplikasi) ){
        $title = $aplikasi->nama;
        $logo = is_null($aplikasi->logo) || $aplikasi->logo == "" ? $logo : $aplikasi->logo;
    }
    setlocale(LC_TIME, 'id_ID');
		\Carbon\Carbon::setLocale('id');

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
				@if( auth()->user()->level == 'hrd' || auth()->user()->level == 'developer' )
					<div class="row">
						<div class="col-md-12">
							<a class="btn btn-xs btn-success" href="/gaji/create" ><i class="fa fa-plus"></i> Proses Penggajian</a>
							
							<div class="clearfix"></div>
						</div>
					</div>
				@endif
				
			</div>

			<div class="x_content">
				<div class="container-fluid">
					
					<div class="form-group row">
						<label class="control-label col-md-1 col-sm-1 col-xs-6">Periode</label>
						<div class="col-md-3 col-sm-3 col-xs-6 ">
							
							<div class="control-group">
							  <div class="controls">
							    <div class="col-md-11 xdisplay_inputx form-group has-feedback">
							      <input type="text" class="form-control has-feedback-left" id="tahun-bulan" placeholder="Periode" aria-describedby="inputSuccess2Status4">
							      <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
							      <span id="inputSuccess2Status4" class="sr-only">(success)</span>
							    </div>
							  </div>
							</div>
						</div>

						<div style="display: none;">
							<label class="control-label col-md-1 col-sm-1 col-xs-6">Tahun</label>
							<div class="col-md-2 col-sm-2 col-xs-6 ">
								<select id="filter-tahun" class="form-control">
									<option value="">Pilih Tahun</option>
									@foreach($tahuns as $tahun)
										<option value="{{ $tahun->tahun }}">{{ $tahun->tahun }}</option>
									@endforeach
								</select>
							</div>
							<label class="control-label col-md-1 col-sm-1 col-xs-6">Bulan</label>
							<div class="col-md-2 col-sm-2 col-xs-6 ">
								<select id="filter-bulan" class="form-control">
									<option value="">Pilih Bulan</option>
									@foreach($bulans as $i => $bulan)
										<option value="{{ $bulan->bulan }}">{{ $bulan->nama_bulan }}</option>
									@endforeach
								</select>
							</div>
							
						</div>
					</div>
					
				</div>
				
				<table id="datatable-gaji" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th rowspan="2">No.</th>
							<th rowspan="2">NIK</th>
							<th rowspan="2">Nama</th>
							<th colspan="2">Tahun Bulan</th>
							<th rowspan="2">Periode</th>
							<th rowspan="2">Gaji Pokok</th>
							<th colspan="4">Ringkasan Kehadiran</th>
							<th colspan="4">Potongan</th>
							<th rowspan="2">Bonus</th>
							<th rowspan="2">Total</th>
							<th rowspan="2">Keterangan</th>
							<th rowspan="2" width="20%">Aksi</th>
							@if( auth()->user()->level == 'hrd' || auth()->user()->level == 'developer' )
							@endif
						</tr>
						<tr>
							<th>Tahun</th>
							<th>Bulan</th>
							<th>Hr Kerja</th>
							<th>Hr Izin</th>
							<th>Hr Sakit</th>
							<th>Hr Cuti</th>
							<th>BPJS Kes.</th>
							<th>BPJS TK.</th>
							<th>BPJS JHT.</th>
							<th>Pot. Lain</th>							
						</tr>
					</thead>
					<tbody>
						<?php $no=1; ?>
						@foreach($data as $d)
						<tr  >
							<td>{{ $no++ }}</td>
							<td>{{ str_pad( $d->nik, 4, '0', STR_PAD_LEFT) }}</td>
							<td>{{ $d->nama_pegawai }}</td>
							<td>{{ $d->tahun }}</td>
							@php
								$monthNum  = $d->bulan;
								$dateObj   = DateTime::createFromFormat('!m', $monthNum);
								$monthName = $dateObj->format('F'); // March
								\Carbon\Carbon::setLocale('id');
							@endphp
							<td>{{ $monthName }}</td>
							<td>{{ $d->tahun }}-{{ $monthName }}</td>
							<td>Rp.{{ number_format($d->gaji_pokok) }}</td>
							<td>{{ $d->hari_kerja }}</td>
							<td>{{ $d->hari_izin }}</td>
							<td>{{ $d->hari_sakit }}</td>
							<td>{{ $d->hari_cuti }}</td>
							<td>Rp.{{ number_format($d->bpjs_kesehatan) }}</td>
							<td>Rp.{{ number_format($d->bpjs_tk) }}</td>
							<td>Rp.{{ number_format($d->bpjs_jht) }}</td>
							<td>Rp.{{ number_format($d->potongan_lain) }}</td>
							<td>Rp.{{ number_format($d->bonus) }}</td>
							<td>Rp.{{ number_format($d->total) }}</td>
							<td>{{ $d->keterangan }}</td>
							
							<td>
								<a onclick="openSlip('{{ $d->id }}')" class="btn btn-xs btn-success"><i class="fa fa-print" ></i> Slip</a>

								@if( auth()->user()->level == 'hrd' || auth()->user()->level == 'developer' )
									<a href="/gaji/edit/{{ $d->id }}" class="btn btn-xs btn-warning"><i class="fa fa-pencil-square-o"></i> Edit</a>
									<a href="/gaji/delete/{{ $d->id }}" class="btn btn-xs btn-danger" onclick="return confirm('Apakah anda ingin menghapus data ini?');" data-popup="tooltip" data-original-title="Hapus Data"><i class="fa fa-trash"></i> Hapus</a>
								@endif

							</td>
							
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>

	</div>
</div>

<!-- Large modal -->

<div class="modal fade bs-example-modal-lg " tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
      		<div class="modal-header bg-info">
      		    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		    <h4 class="modal-title text-center" id="gridSystemModalLabel">Slip Gaji</h4>
      		</div>
      		<div class="modal-body p-0">
      			<div class="embed-responsive embed-responsive-16by9">
      			    <iframe id="frame-slip" class="embed-responsive-item" src="about:blank">
      			    	
      			    </iframe>
      			</div>
      		</div>
    	</div>
  	</div>
</div>

@endsection

@push('script')

<script type="text/javascript">
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
		var table = $('#datatable-gaji').DataTable({
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
	function openSlip(id){
		$('#frame-slip').attr('src', '/gaji/slip/'+id);
		$('.bs-example-modal-lg').modal('show');
	}

	$('.bs-example-modal-lg').on('hidden.bs.modal', function () {
	    $('#frame-slip').html('');
	    $('#frame-slip').attr('src', 'about:blank');
	});
	

</script>
@endpush