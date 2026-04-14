import QtQuick 6.4
import QtQuick.Controls 6.4
import QtQuick.Window 2.15

ApplicationWindow {
    id: root
    visible: true
    width: 390
    height: 844
    title: "Agência Med"
    color: "#EEF2F8"

    property string telaAtual: "welcome"
    onTelaAtualChanged: console.log("main.qml: telaAtual mudou para: " + telaAtual)
    property var usuarioLogado: null

    // --- Banco de dados ---
    Database {
        id: db
    }

    Component.onCompleted: {
        db.inicializar()
    }

    // Cadastra novo usuário no banco e loga automaticamente
    function cadastrar(usuario, email, telefone, papel, senha) {
        db.salvarUsuario(usuario, email, telefone, papel, senha)
        root.usuarioLogado = { "usuario": usuario, "email": email, "telefone": telefone, "papel": papel, "senha": senha }
        root.telaAtual = "welcome"
    }

    // Valida login consultando o banco
    function entrar(usuario, senha) {
        var u = db.validarLogin(usuario, senha)
        if (u !== null) {
            root.usuarioLogado = u
            return true
        }
        return false
    }

    WelcomeScreen {
        anchors.fill: parent
        visible: root.telaAtual === "welcome"
        enabled: visible
        onIrParaLogin: root.telaAtual = "login"
        onIrParaCadastro: root.telaAtual = "cadastro"
    }


    LoginScreen {
        id: telaLogin
        anchors.fill: parent
        visible: root.telaAtual === "login"
        enabled: visible
        onVoltar: root.telaAtual = "welcome"
        onIrParaCadastro: root.telaAtual = "cadastro"
        onFazerLogin: function(u, s) {
            if (root.entrar(u, s)) {
                root.telaAtual = "home"
            } else {
                telaLogin.exibirErro()
            }
        }
    }

    RegisterScreen {
        anchors.fill: parent
        visible: root.telaAtual === "cadastro"
        enabled: visible
        onVoltar: root.telaAtual = "welcome"
        onCadastrar: function(u, e, t, p, s) {
            root.cadastrar(u, e, t, p, s)
        }
    }

    HomeScreen {
        id: homeDashboard
        anchors.fill: parent
        visible: root.telaAtual === "home"
        enabled: visible

        onVisibleChanged: {
            if (visible && root.usuarioLogado) {
                homeDashboard.nomePaciente = root.usuarioLogado.usuario
                homeDashboard.emailPaciente = root.usuarioLogado.email
            }
        }

        onSair: {
            root.usuarioLogado = null
            root.telaAtual = "welcome"
        }
        onIrParaConfiguracoes: root.telaAtual = "settings"
        onIrParaPerfil: root.telaAtual = "perfil"
        onIrParaExames: root.telaAtual = "exames"
        onIrParaAgendamentos: root.telaAtual = "consultas"
    }

    SettingsScreen {
        anchors.fill: parent
        visible: root.telaAtual === "settings"
        enabled: visible
        onVoltar: root.telaAtual = "home"
    }

    PerfilScreen {
        id: perfilDashboard
        anchors.fill: parent
        visible: root.telaAtual === "perfil"
        enabled: visible
        
        onVisibleChanged: {
            if (visible && root.usuarioLogado) {
                perfilDashboard.nomePaciente = root.usuarioLogado.usuario
                perfilDashboard.emailPaciente = root.usuarioLogado.email
            }
        }

        onVoltar: root.telaAtual = "home"
        onSair: {
            root.usuarioLogado = null
            root.telaAtual = "welcome"
        }
        onIrParaConfiguracoes: root.telaAtual = "settings"
    }

    ExamesScreen {
        id: examesDashboard
        anchors.fill: parent
        visible: root.telaAtual === "exames"
        enabled: visible
        
        onVisibleChanged: {
            if (visible && root.usuarioLogado) {
                examesDashboard.nomePaciente = root.usuarioLogado.usuario
                examesDashboard.emailPaciente = root.usuarioLogado.email
            }
        }

        onVoltar: root.telaAtual = "home"
        onSair: {
            root.usuarioLogado = null
            root.telaAtual = "welcome"
        }
        onIrParaConfiguracoes: root.telaAtual = "settings"
    }

    ConsultasScreen {
        id: consultasDashboard
        anchors.fill: parent
        visible: root.telaAtual === "consultas"
        enabled: visible
        
        onVisibleChanged: {
            if (visible && root.usuarioLogado) {
                consultasDashboard.nomePaciente = root.usuarioLogado.usuario
                consultasDashboard.emailPaciente = root.usuarioLogado.email
            }
        }

        onVoltar: root.telaAtual = "home"
        onSair: {
            root.usuarioLogado = null
            root.telaAtual = "welcome"
        }
        onIrParaConfiguracoes: root.telaAtual = "settings"
    }
}
