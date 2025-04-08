object DMPrincipal: TDMPrincipal
  OnCreate = DataModuleCreate
  Height = 358
  Width = 417
  object FireDacCon: TFDConnection
    Params.Strings = (
      'Database=SOPHIA'
      'Encrypt=No'
      'OSAuthent=Yes'
      'Server=localhost\SQLEXPRESS'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=WELINGTON-PC'
      'MARS=yes'
      'DriverID=MSSQL')
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
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 200
    Top = 184
  end
end
