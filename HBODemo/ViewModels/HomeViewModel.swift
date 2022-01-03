//
//  MoviesViewModel.swift
//  HBODemo
//
//  Created by Essam Orabi on 01/01/2022.
//

import Foundation

class HomeViewModel: ViewModel {
    var trendingMoviesResult: TrendingMovies?
    var trendingTVResult: TrendingMovies?
    var upcomingMoviesResult: TrendingMovies?
    var popularmoviesResult: TrendingMovies?

    func getTrendingMovies(onComplete: @escaping(_ errorMessage : String?,_ ErrorResponse:ResponseModel?, _ state:State)->()) {

        let url = AppConstant.trendingMovies
        let  encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let resource = Resource<TrendingMovies>(url: encodedUrl,httpMethod:.get,parameters:[:], header:[:])
        HttpApiCallingWithRep.requestWithBody(resource: resource) { (Result, StatusCode, Mesg, errorResponse) in
            if StatusCode == 200 {
                if let info = Result{
                    self.trendingMoviesResult = info
                    onComplete(nil, nil, .populated)
                } else {
                    onComplete(Mesg, errorResponse, .error)
                }
            } else {
                onComplete(Mesg, errorResponse, .error)
            }
        }
    }

    func getTrendingTvs(onComplete: @escaping(_ errorMessage : String?,_ ErrorResponse:ResponseModel?, _ state:State)->()) {

        let url = AppConstant.trendingTV
        let  encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let resource = Resource<TrendingMovies>(url: encodedUrl,httpMethod:.get,parameters:[:], header:[:])
        HttpApiCallingWithRep.requestWithBody(resource: resource) { (Result, StatusCode, Mesg, errorResponse) in
            if StatusCode == 200 {
                if let info = Result{
                    self.trendingTVResult = info
                    onComplete(nil, nil, .populated)
                } else {
                    onComplete(Mesg, errorResponse, .error)
                }
            } else {
                onComplete(Mesg, errorResponse, .error)
            }
        }
    }

    func getUpcomingMovies(onComplete: @escaping(_ errorMessage : String?,_ ErrorResponse:ResponseModel?, _ state:State)->()) {

        let url = AppConstant.upcomingMovies
        let  encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let resource = Resource<TrendingMovies>(url: encodedUrl,httpMethod:.get,parameters:[:], header:[:])
        HttpApiCallingWithRep.requestWithBody(resource: resource) { (Result, StatusCode, Mesg, errorResponse) in
            if StatusCode == 200 {
                if let info = Result{
                    self.upcomingMoviesResult = info
                    onComplete(nil, nil, .populated)
                } else {
                    onComplete(Mesg, errorResponse, .error)
                }
            } else {
                onComplete(Mesg, errorResponse, .error)
            }
        }
    }

    func getPopular(onComplete: @escaping(_ errorMessage : String?,_ ErrorResponse:ResponseModel?, _ state:State)->()) {

        let url = AppConstant.popularMovies
        let  encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let resource = Resource<TrendingMovies>(url: encodedUrl,httpMethod:.get,parameters:[:], header:[:])
        HttpApiCallingWithRep.requestWithBody(resource: resource) { (Result, StatusCode, Mesg, errorResponse) in
            if StatusCode == 200 {
                if let info = Result{
                    self.popularmoviesResult = info
                    onComplete(nil, nil, .populated)
                } else {
                    onComplete(Mesg, errorResponse, .error)
                }
            } else {
                onComplete(Mesg, errorResponse, .error)
            }
        }
    }
}
