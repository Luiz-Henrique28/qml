import QtQuick 6.4
import QtQuick.LocalStorage 2.15

// Database.qml — Helper de banco de dados SQLite para AgenciaMed
// Uso: instancie com  Database { id: db }  e chame db.inicializar() no Component.onCompleted
QtObject {
    id: dbHelper

    // --- Referência interna ao banco ---
    property var _db: null

    // Abre (ou cria) o banco e garante que a tabela existe.
    function inicializar() {
        _db = LocalStorage.openDatabaseSync(
            "AgenciaMedDB",  // nome do banco
            "1.0",           // versão
            "Banco AgenciaMed",
            1000000          // tamanho estimado (1 MB)
        )

        _db.transaction(function(tx) {
            tx.executeSql(
                "CREATE TABLE IF NOT EXISTS usuarios (" +
                "  usuario   TEXT PRIMARY KEY," +
                "  email     TEXT NOT NULL," +
                "  telefone  TEXT," +
                "  papel     TEXT NOT NULL," +
                "  senha     TEXT NOT NULL" +
                ")"
            )
        })

        console.log("Database: banco inicializado com sucesso.")
    }

    // Salva (insere ou atualiza) um usuário no banco.
    function salvarUsuario(usuario, email, telefone, papel, senha) {
        if (!_db) { console.warn("Database: banco não inicializado!"); return false }
        var ok = false
        _db.transaction(function(tx) {
            tx.executeSql(
                "INSERT OR REPLACE INTO usuarios (usuario, email, telefone, papel, senha) " +
                "VALUES (?, ?, ?, ?, ?)",
                [usuario, email, telefone, papel, senha]
            )
            ok = true
        })
        return ok
    }

    // Busca todos os usuários e retorna um array JS com o mesmo formato usado antes.
    function carregarUsuarios() {
        if (!_db) { console.warn("Database: banco não inicializado!"); return [] }
        var lista = []
        _db.readTransaction(function(tx) {
            var rs = tx.executeSql("SELECT * FROM usuarios")
            for (var i = 0; i < rs.rows.length; i++) {
                var r = rs.rows.item(i)
                lista.push({
                    usuario:  r.usuario,
                    email:    r.email,
                    telefone: r.telefone,
                    papel:    r.papel,
                    senha:    r.senha
                })
            }
        })
        return lista
    }

    // Valida login: retorna o objeto do usuário se credenciais corretas, null caso contrário.
    function validarLogin(usuario, senha) {
        if (!_db) { console.warn("Database: banco não inicializado!"); return null }
        var encontrado = null
        _db.readTransaction(function(tx) {
            var rs = tx.executeSql(
                "SELECT * FROM usuarios WHERE usuario = ? AND senha = ? LIMIT 1",
                [usuario, senha]
            )
            if (rs.rows.length > 0) {
                var r = rs.rows.item(0)
                encontrado = {
                    usuario:  r.usuario,
                    email:    r.email,
                    telefone: r.telefone,
                    papel:    r.papel,
                    senha:    r.senha
                }
            }
        })
        return encontrado
    }
}
