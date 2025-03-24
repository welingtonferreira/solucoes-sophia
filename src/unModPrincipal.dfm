object DMPrincipal: TDMPrincipal
  OnCreate = DataModuleCreate
  Height = 358
  Width = 417
  object FireDacCon: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'Database=SISMASTER'
      'DriverID=MySQL')
    TxOptions.Isolation = xiReadCommitted
    TxOptions.AutoStop = False
    TxOptions.StopOptions = [xoIfAutoStarted]
    LoginPrompt = False
    Transaction = FireTransCon
    UpdateTransaction = FireTransCon
    Left = 40
    Top = 16
  end
  object FireTransCon: TFDTransaction
    Options.Isolation = xiReadCommitted
    Options.AutoStop = False
    Options.StopOptions = [xoIfAutoStarted]
    Connection = FireDacCon
    Left = 40
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 208
    Top = 104
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\BACKUP\Testes\SisMaster\bin\LIBMYSQL.DLL'
    Left = 208
    Top = 48
  end
end
