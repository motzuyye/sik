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
		    <div class="x_title text-center">
		        <h2>{{ $title }}</h2>
		        <div class="clearfix"></div>
		        <div class="row">
		        	
		        	<div class="col-md-6">
		        		<button class="btn btn-success pull-left" onclick="print()"><i class="fa fa-print"></i></button>
		        	</div>
			        <div class="col-md-6 col-lg-6 pull-right">
	        	        <form action="/laporan/gaji/print" method="get" enctype="multipart/form-data" class="form-inline form-horizontal form-label-left" autocomplete="off" >
	        		        {{ csrf_field() }}
	        		        <div class="form-group">
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
	        		        
							{{-- <select id="filter-tahun"  class="form-control" name="tahun" >
				            	<option value="">-- pilih tahun --</option>
				            	@foreach( $yearMonth['year'] as $m => $v )
				              		<option value="{{ $v }}" @if( $v == Date('Y') )  @endif >{{ $v }}</option>
				            	@endforeach
				            </select>
				            <select id="filter-bulan" class="form-control" name="bulan" >
				            	<option value="">-- pilih bulan --</option>
				              	@foreach( $yearMonth['month'] as $m => $v )
				                	<option value="{{ $v['value'] }}" @if( $v['value'] == Date('m') )  @endif >{{ $v['name'] }}</option>
				              	@endforeach
				            </select> --}}
				            
			            	<button type="button" class="btn btn-primary" style="margin-bottom: 0" onclick="print()">Cetak Laporan</button>
			            </form>
			        </div>
		        </div>
		        
			        
		        
		    </div>

		    <div class="x_content col-md-12"  >
		        <div style="">
		            <div style="overflow-x: scroll; overflow-y: hidden;">
			            <table id="datatable-gaji" class="table table-striped table-bordered nowrap " cellspacing="0" >
			                <thead>
				                <tr>
				                    <th rowspan="2" class="text-center">No.</th>
				                    <th rowspan="2" class="text-center">Tahun</th>
				                    {{-- <th rowspan="2" class="text-center">Bulan No</th> --}}
				                    <th rowspan="2" class="text-center">Bulan</th>
				                    <th rowspan="2" class="text-center">Gaji Pokok</th>
				                    <th colspan="4" class="text-center">Ringkasan Kehadiran</th>
				                    <th colspan="4" class="text-center">Potongan</th>
				                    <th rowspan="2" class="text-center">Bonus</th>
				                    <th rowspan="2" class="text-center">Total</th>

				                </tr>
				                <tr>
				                    <th class="text-center">Hr Kerja</th>
				                    <th class="text-center">Hr Izin</th>
				                    <th class="text-center">Hr Sakit</th>
				                    <th class="text-center">Hr Cuti</th>
				                    <th class="text-center">BPJS Kes.</th>
				                    <th class="text-center">BPJS TK.</th>
				                    <th class="text-center">BPJS JHT.</th>
				                    <th class="text-center">Pot. Lain</th>              
				                </tr>
			                </thead>
			                @if(count($data) > 0 )            
				                <tbody class="" >
				                    <?php $no=1; $idx = 0; ?>
				                    @foreach($data as $d)
					                    <tr  >
						                    <td align="center">{{ $no++ }}</td>
						                    <td align="center">{{$d->tahun}}</td>
						                    {{-- <td align="center">{{$d->bulan}}</td> --}}
						                    <td align="center">{{$d->nama_bulan}}</td>
						                    <td align="right">Rp.{{number_format($d->gaji_pokok)}}</td>
						                    <td align="center">{{$d->hari_kerja}}</td>
						                    <td align="center">{{$d->hari_izin}}</td>
						                    <td align="center">{{$d->hari_sakit}}</td>
						                    <td align="center">{{$d->hari_cuti}}</td>
						                    <td align="right">Rp.{{number_format($d->bpjs_kesehatan)}}</td>
						                    <td align="right">Rp.{{number_format($d->bpjs_tk)}}</td>
						                    <td align="right">Rp.{{number_format($d->bpjs_jht)}}</td>
						                    <td align="right">Rp.{{number_format($d->potongan_lain)}}</td>
						                    <td align="right">Rp.{{number_format($d->bonus)}}</td>
						                    <td align="right">Rp.{{number_format($d->total)}}</td>
					                    </tr>
				                    	<?php $idx++; ?>
				                    @endforeach
				                </tbody>

			                @endif
			            </table>
		            </div>
		        </div>
		    </div>
	    </div>
	</div>
</div>

<!-- Large modal -->

<div class="modal fade bs-modal-lg " tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
      		<div class="modal-header bg-info">
      		    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		    <h4 class="modal-title text-center" id="gridSystemModalLabel">LAPORAN GAJI</h4>
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
	/*$.fn.dataTable.ext.search.push(
		function( settings, data, dataIndex ) {
			var filterTahun = parseInt( $('#filter-tahun').val(), 10 );
			var filterBulan = parseInt( $('#filter-bulan').val(), 10 );
			var tahun = parseFloat( data[1] ) || 0; // use data for the age column
			var bulan = parseFloat( data[2] ) || 0; // use data for the age column
			
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
				var tahun = parseFloat( data[1] ) || 0; // use data for the age column
				var bulan = data[2] || ""; // use data for the age column
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
			columnDefs: [
	            {
	                target: 2,
	                visible: false,
	                searchable: false,
	            },
	        ],
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

	function print(){
		tahun = $('#filter-tahun').val();
		bulan = $('#filter-bulan').val();
		periode = $('#tahun-bulan').val();
		//$('#frame-slip').attr('src', '/laporan/gaji/print?tahun='+tahun+'&bulan='+bulan);
		$('#frame-slip').attr('src', '/laporan/gaji/print?periode='+periode);
		$('.bs-modal-lg').modal('show');
	}

	$('.bs-modal-lg').on('hidden.bs.modal', function () {
	    $('#frame-slip').html('');
	    $('#frame-slip').attr('src', 'about:blank');
	});
</script>
@endpush