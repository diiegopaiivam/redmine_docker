class CreateCreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :create_projects, comment: 'Tabela criada para armazenar dados para o plugin de criação do projeto' do |t|
      t.string :name, comment: 'Nome do projeto'
      t.string :identifier, comment: 'Identificador do Projeto'
      t.text :description, comment: 'Descrição do projeto'
      t.boolean :is_public, comment: 'Projeto publico ou privado'
      t.boolean :inherit_members, comment: 'Membros herdados'
      t.string :tracker_ids, comment: 'Tipos de tarefas'
      t.string :enabled_module_names, comment: 'Habilitar modulos'
      t.integer :user_id, comment: 'Ids dos usuários para associar membros'
      t.string :roles_ids, comment: 'Grupos de usuários para associar'
      t.string :name_version, comment: "Nome da versão do projeto"
      t.text :description_version, comment: "Descrição do projeto"
      t.string :wiki_page_title, comment: "Título da página wiki"
      t.string :subject_issue, comment: "Título da tarefa"
      t.integer :priority_id_issue, comment: "Prioridade da tarefa"
      t.integer :status_id_issue, comment: "status da tarefa"
      t.integer :tracker_id_issue, comment: "Tipo da tarefa"
    end
  end
end
