Ext.onReady ->
  Ext.define 'Task',
    extend: 'Ext.data.Model',
    fields: [ 'id', 'name', 'start_date', 'end_date' ]

  taskStore = Ext.create 'Ext.data.Store',
    model: 'Task',
    autoLoad: true,
    autoSync:true,
    proxy:
      type: 'rest',
      url: "/projects/#{PM.current_project_id}/tasks",
      format: 'json',
      reader:
        type: 'json',
        root: 'tasks'
      writer:
        type: 'json'

  Ext.create 'Ext.grid.Panel',
    renderTo: Ext.get('tasks'),
    store: taskStore,
    height: 200,
    title: 'Application Tasks',
    columns: [
      text: 'Name',
      width: 100,
      hideable: false,
      dataIndex: 'name'
    ,
      text: 'Start Date',
      width: 150,
      dataIndex: 'start_date',
    ,
      text: 'End Date',
      width: 150,
      dataIndex: 'end_date'
    ,
      sortable: false,
      width: 100,
      header: "actions",
      xtype: 'actioncolumn',
      items: [
        icon: '/assets/extjs-4.1.0/examples/shared/icons/fam/delete.gif',
        handler: (grid, rowIndex, colIndex) ->
          rec = grid.getStore().getAt(rowIndex)
          rec.store.remove(rec)
      ]
    ]
