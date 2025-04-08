program Sophia;

uses
  Vcl.Forms,
  unModPrincipal in 'unModPrincipal.pas' {DMPrincipal: TDataModule},
  unModCadastros in 'unModCadastros.pas' {dtCadastros: TDataModule},
  unCadastroClientes0 in 'unCadastroClientes0.pas' {frmCadastroClientes0},
  unCadastroProdutos0 in 'unCadastroProdutos0.pas' {frmCadastroProdutos0},
  unCadastroClientes1 in 'unCadastroClientes1.pas' {frmCadastroClientes1},
  unCadastroProdutos1 in 'unCadastroProdutos1.pas' {frmCadastroProdutos1},
  unModSelecoes in 'unModSelecoes.pas' {dtSelecoes: TDataModule},
  uUtil in 'uUtil.pas',
  unCadastroLogin in 'unCadastroLogin.pas' {frmCadastro},
  unLogin in 'unLogin.pas' {frmLogin},
  unPedidosVenda0 in 'unPedidosVenda0.pas' {frmPedidosVenda0},
  unPedidoVendaItens in 'unPedidoVendaItens.pas' {frmPedidoVendaItens},
  uConsultaProduto in 'uConsultaProduto.pas' {frmConsultaProduto},
  unPedidosVenda1 in 'unPedidosVenda1.pas' {frmPedidosVenda1},
  uConsultaCliente in 'uConsultaCliente.pas' {frmConsultaCliente},
  uRelVendas in 'uRelVendas.pas' {frmRelVendas},
  unParametros in 'unParametros.pas' {frmParametros},
  uRelListaProdutosVendidos in 'uRelListaProdutosVendidos.pas' {frmRelListaProdutosVendidos},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  uSobre in 'uSobre.pas' {frmSobre},
  uConsultaUsuarios in 'uConsultaUsuarios.pas' {frmConsultaUsuarios},
  unControleAcesso in 'unControleAcesso.pas' {frmControleAcesso},
  uRelEstoqueProdutos in 'uRelEstoqueProdutos.pas' {frmRelEstoqueProdutos},
  uBarChart in 'diversos\uBarChart.pas',
  uChart in 'diversos\uChart.pas',
  uRelGraficoVendas0 in 'uRelGraficoVendas0.pas' {frmRelGraficoVendas0},
  uRelGraficoVendas1 in 'uRelGraficoVendas1.pas' {frmRelGraficoVendas1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
