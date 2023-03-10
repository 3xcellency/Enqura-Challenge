//
//  MainVM.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//
import RxSwift
import RxCocoa
import Moya

class MainVM: BaseVM {
    let goToMainVC = PublishSubject<Void>()
    let goToDetail = PublishSubject<CharacterResponseResult>()
    let disposeBag = DisposeBag()
    let section =   BehaviorRelay<[CharacterResponseResult]>(value: [])
    var offset = 0
    func getCharacters(limit: Int = 30, offset: Int = 0){
        self.offset += offset
        let paramaters: [String : Any] =  ["orderBy" : "modified",  "limit" : limit, "offset": self.offset ]
        self.showLoading.onNext(true)
        Service.shared.request(endpoint: Endpoints.characters.rawValue, model: CharacterResponse.self, method: .get, parameters: paramaters, encoding: URLEncoding.queryString, completion: { response in
            if let err = response.error {
                self.error.onNext(err.localizedDescription)
                return
            }
            self.showLoading.onNext(false)
            if let res = response.response, let results = res.data?.results  {
                self.section.accept(self.section.value + results)
            }
        })
    }
}
