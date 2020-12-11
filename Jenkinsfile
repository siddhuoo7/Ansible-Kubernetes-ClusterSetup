node{
    stage("git clone"){
        git credentialsId: '7cf7dbf3-4fa5-4983-8ce6-f9f7369f3094', url: 'http://192.168.75.53/root/kubernetes_cluster_ansible.git'
    }
    stage("Cleanup existing cluster"){
      sh """
      sed -i "s|masterNode|${masterNode}|g; s|nodeOne|${node1}|g; s|nodeTwo|${node2}|g; s|nodeThree|${node3}|g"  hosts
       chmod 777 ssh-setup.sh
       ./ssh-setup.sh 'password' ${masterNode} ${node1} ${node2} ${node3}
      ansible-playbook uninstall_kube_cluster.yml
      """
    }
    stage("kubernetes prerequisites instllation"){
       sh """
        chmod 777 ssh-setup.sh
        ./ssh-setup.sh 'password' ${masterNode} ${node1} ${node2} ${node3}
        ansible-playbook disable-selinux.yml
         """
       sleep(50)
    }
    stage("Deploying kubernetes cluster"){
       sh "ansible-playbook setup_kube_cluster.yml"
     //ansiblePlaybook(credentialsId: 'azure', become: true, becomeUser: 'imsadmin', inventory: 'hosts', playbook: 'setup_kube_cluster.yml')
    }
   
    stage("additional-installation"){
       sh "ansible-playbook additional-installation.yaml"
    }

}