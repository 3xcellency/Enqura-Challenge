//
//  DetailVM.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//
import RxSwift
import RxCocoa
import Moya

class DetailVM: BaseVM {
    let goToMainVC = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    let section =   BehaviorRelay<CharacterItems>(value: [])
    func getComics(id: Int, limit: Int = 10, modifiedSince: String = "2005-01-01T00:00:00-050"){
        let paramaters: [String : Any] =  ["orderBy" : "-modified",  "limit" : limit, "modifiedSince": modifiedSince ]
        self.showLoading.onNext(true)
        Service.shared.request(endpoint: Endpoints.characters.rawValue.appending("/\(id)/comics"), model: CharacterResponse.self, method: .get, parameters: paramaters, encoding: URLEncoding.queryString, completion: { response in
            self.showLoading.onNext(false)
            if let err = response.error {
                self.error.onNext(err.localizedDescription)
                return
            }
            if let res = response.response, let results = res.data?.results  {
               self.section.accept(results)
            }
        })
    }
}
