abstract class RemoteProductEvent {
  const RemoteProductEvent();
}

class GetAllProducts extends RemoteProductEvent {
  const GetAllProducts();
}

class GetWomenProducts extends RemoteProductEvent {
  const GetWomenProducts();
}

class GetMenProducts extends RemoteProductEvent {
  const GetMenProducts();
}

class GetElectronicsProducts extends RemoteProductEvent {
  const GetElectronicsProducts();
}

class GetJeweleryProducts extends RemoteProductEvent {
  const GetJeweleryProducts();
}
